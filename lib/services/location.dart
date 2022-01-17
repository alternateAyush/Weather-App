import 'package:geolocator/geolocator.dart';

class GeoLocation {
  double longitude = 0;
  double latitude = 0;

  Future<void> getCurrLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
