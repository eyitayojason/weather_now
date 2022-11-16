import 'package:geolocator/geolocator.dart';

class Location {
  var latitude;
  var longitude;
  bool? serviceEnabled;
  Future<void> getCurrentLocation() async {
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // print("Location services $serviceEnabled");

    // if (!serviceEnabled!) {
    //   await Geolocator.openLocationSettings().catchError((e) {
    //     print(e.toString());
    //   });
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    latitude = position.latitude;
    longitude = position.longitude;
  }
}
