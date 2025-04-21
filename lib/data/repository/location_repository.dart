import 'dart:convert';

import 'package:http/http.dart';
import 'package:location_app/data/model/location.dart';

class LocationRepository {
  Future<List<Location>> searchLocations(String query) async {
    final client = Client();
    final response = await client.get(
      Uri.parse(
        'https://openapi.naver.com/v1/search/local.json?query=$query&display=5',
      ),
      headers: {
        'X-Naver-Client-Id': 'd4fpDsjW95lJPtpSKbfk',
        'X-Naver-Client-Secret': '00aWH1wCuT',
      },
    );
    // Get 요청성공시 응답코드를 보통 200으로 보내줌
    // 응답코드가 200일때 body데이터를 jsonDecode 함수를 이용하여 map으로 바꾼 후 List<location>로 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      // MappedIterable 이라는 클래스에 함수를 넘겨주고
      // 나중에 요청 시, 그 때 List(items) 들을 하나 씩 반복문을 돌며
      // 내가 넘겨준 함수를 실행시켜서 새로운 리스트를 실행시켜주는 역할(24~27번째 열)
      final iterable = items.map((e) {
        return Location.formJson(e);
      });

      final list = iterable.toList();
      return list;
    }
    // 응답코드가 200이 아닐때 빈 리스트 반환
    return [];
  }
}
