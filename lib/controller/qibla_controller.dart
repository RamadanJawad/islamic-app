import 'dart:async';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class QiblaController extends GetxController{

  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  Future<void> checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();

      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLocationStatus();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}