import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt index = 3.obs;
  void onTap(int val) {
    index.value = val;
  }
}
