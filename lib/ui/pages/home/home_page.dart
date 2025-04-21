import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_app/ui/pages/detail/detail_page.dart';
import 'package:location_app/ui/pages/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // A 뷰모델에 접근하기 위해 필요한 위젯(Consumer)
    return Consumer(
      builder: (context, ref, child) {
        // B 상태와 뷰모델 가지고와서 변수에 담아주기
        final state = ref.watch(homeviewmodelProvider);
        final viewModel = ref.read(homeviewmodelProvider.notifier);
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 247, 238, 249),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 247, 238, 249),
              title: TextField(
                // 텍스트필드에서 사용자가 입력을 마친 뒤 엔터 누르면 실행되는 함수
                // 벨류에 사용자가 입력한 값이 전달됨
                onSubmitted: (value) {
                  // C 뷰모델에 서치 함수 호출하기
                  viewModel.searchLocations(value);
                },
                maxLines: 1,
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: '검색어를 입력해 주세요',
                  // TextField 상태에 따라 다른 테두리 적용하고 싶을 때!
                  border: WidgetStateInputBorder.resolveWith((states) {
                    print(states);
                    if (states.contains(WidgetState.focused)) {
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      );
                    }
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    );
                  }),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    // C listView 빌더로 바꾸기
                    // D 뷰모델 상태 가지고 와서 리스트뷰에 뿌려주기
                    child: ListView.builder(
                      itemCount: state.locations.length,
                      itemBuilder: (context, index) {
                        final location = state.locations[index];
                        return GestureDetector(
                          onTap: () {
                            // 링크가 비어있을 때 페이지 이동이 되지않도록 하기
                            if (location.link.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('이동할 링크가 없습니다')),
                              );
                              return;
                              // 디테일 페이지로 로케이션에 링크보내주기
                              // 페이지 이동시 데이터 전달
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailPage(link: location.link);
                                  },
                                ),
                              );
                            } else {
                              // 사용자에게 알려주기
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('이 장소는 링크 정보가 없습니다.')),
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  location.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ), //title

                                Text(location.category), //category
                                Text(location.address), //roadAddress
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
