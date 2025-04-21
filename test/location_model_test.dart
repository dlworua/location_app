import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:location_app/data/model/location.dart';

void main() {
  test('Location model test', () {
    String dummyData = """
     {
      "title": "삼성1동 주민센터",
      "link": "http://www.gangnam.go.kr/center/main.do?office=3220047",
      "category": "공공,사회기관>행정복지센터",
      "description": "",
      "telephone": "",
      "address": "서울특별시 강남구 삼성1동 161-2",
      "roadAddress": "서울특별시 강남구 봉은사로 616 삼성1동 주민센터",
      "mapx": "1270625320",
      "mapy": "375144424"
      }
      """;
    // 1. map으로 변환(jsonDecode 사용
    Map<String, dynamic> map = jsonDecode(dummyData);
    // 2. 객체로 변환
    Location location = Location.formJson(map);
    expect(
      location.mapx,
      '1270625320',
    ); // 객체가 잘 변환되는지 확인하기 위해 expect함수사용 expect(실제값, 기대값);
  });
}
