/* "title": "삼성1동 주민센터",
      "link": "http://www.gangnam.go.kr/center/main.do?office=3220047",
      "category": "공공,사회기관>행정복지센터",
      "description": "",
      "telephone": "",
      "address": "서울특별시 강남구 삼성1동 161-2",
      "roadAddress": "서울특별시 강남구 봉은사로 616 삼성1동 주민센터",
      "mapx": "1270625320",
      "mapy": "375144424" */

import 'dart:io';

class Location {
  String title;
  String link;
  String category;
  String description;
  String telephone;
  String address;
  String roadAddress;
  String mapx;
  String mapy;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });
  // 1. fromJson 생성자 만들기 (중요* 클래스 안에 넣기!)
  Location.formJson(Map<String, dynamic> map)
    : this(
        title: map['title'],
        link: map['link'],
        category: map['category'],
        description: map['description'],
        telephone: map['telephone'],
        address: map['address'],
        roadAddress: map['roadAddress'],
        mapx: map['mapx'],
        mapy: map['mapy'],
      );

  // 2. toJson 생성자 만들기
}
