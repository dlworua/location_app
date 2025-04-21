import 'package:flutter_test/flutter_test.dart';
import 'package:location_app/data/repository/location_repository.dart';

void main() {
  test('LocationRepository test', () async {
    LocationRepository locationRepository = LocationRepository();
    final locations = await locationRepository.searchLocations('삼성동');
    expect(locations.isEmpty, false);
    for (var location in locations) {
      print(location.toJson());
    }
  });
}
