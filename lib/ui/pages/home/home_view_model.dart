// 1. 상태 클래스 만들기
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location_app/data/model/location.dart';
import 'package:location_app/data/repository/location_repository.dart';

class HomeState {
  List<Location> locations;
  HomeState(this.locations);
}

// 2. 뷰모델 만들기 - Notifier 상속
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([]);
  }

  Future<void> searchLocations(String query) async {
    final locationRepository = LocationRepository();
    final locations = await locationRepository.searchLocations(query);
    state = HomeState(locations);
  }
}

// 3. 뷰모델 관리자 만들기 - NotifierProvider 객체
final homeviewmodelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
