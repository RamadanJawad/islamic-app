import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

class LevelQuestionController extends GetxController {
  BuildContext context=Get.context!;
  bool? star(int index) {
    switch (index) {
      case 0:
        return true;
      case 1:
        if (SharedPrefController().getAllStarsPoint! >= 15) {
          return true;
        }
        break;
      case 2:
        if (SharedPrefController().getAllStarsPoint! >= 30) {
          return true;
        }
        break;
      case 3:
        if (SharedPrefController().getAllStarsPoint! >= 45) {
          return true;
        }
        break;
      case 4:
        if (SharedPrefController().getAllStarsPoint! >= 60) {
          return true;
        }
        break;
      case 5:
        if (SharedPrefController().getAllStarsPoint! >= 75) {
          return true;
        }
        break;
      case 6:
        if (SharedPrefController().getAllStarsPoint! >= 90) {
          return true;
        }
        break;
      case 7:
        if (SharedPrefController().getAllStarsPoint! >= 105) {
          return true;
        }
        break;
      case 8:
        if (SharedPrefController().getAllStarsPoint! >= 120) {
          return true;
        }
        break;
      case 9:
        if (SharedPrefController().getAllStarsPoint! >= 135) {
          return true;
        }
        break;
      default:
        return false;
    }
    return false;
  }
}
