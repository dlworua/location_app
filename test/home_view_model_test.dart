import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location_app/ui/pages/home/home_view_model.dart';

void main() {
  test('HomeViewModel test', () async {
    // 앱 내에서는 ProviderScope 안에서 뷰모델 관리
    //테스트 환경에서는 Widget을 생성하지 않고 테스트 할 수 있도록 ProviderContainer 제공
    final providerContainer = ProviderContainer();
    // flutter 패키지내에서 제공하는 함수 (테스트가 끝나게 되면 그때 함수 실행)
    addTearDown(providerContainer.dispose);
    final homeVm = providerContainer.read(homeviewmodelProvider.notifier);
    // 처음 HomeViewModel의 상태 => 빈 리스트인 것을 테스트
    final firstState = providerContainer.read(homeviewmodelProvider);
    expect(firstState.locations.isEmpty, true);

    // HomeViewModel에서 searchLocations 메서드 호출 후 상태가 변경이 정상적으로 되는지 테스트
    await homeVm.searchLocations('삼성동');
    final afterState = providerContainer.read(homeviewmodelProvider);
    expect(afterState.locations.isEmpty, false);
    afterState.locations.forEach((element) {
      print(element.toJson());
    });
  });
}
