import 'package:get/get.dart';

class MainViewController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndex( index) {
    selectedIndex.value = index;
   // update();
  }
}
