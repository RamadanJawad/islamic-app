
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   serviceEnabled = await Geolocator.openAppSettings();
  // }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
        
  }

  return await Geolocator.getCurrentPosition();
}

getLatAndLong() async {
  Position position = await determinePosition();
  SharedPrefController()
      .saveCoordinate(long: position.longitude, lat: position.latitude);
  SharedPrefController().isLogin(isLogin: true);
  Get.toNamed("/main_screen");
  // Get.delete();
}
