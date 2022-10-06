import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  LocationPermission permission;

  Future<void> getCurrentLocation() async {
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          print(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
