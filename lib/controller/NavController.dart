import 'package:get/get.dart';

import 'package:get/get.dart';

class NavController extends GetxController {
  var index = 0.obs;
  void SetIndexis(var indx) {
    index.value = indx;
  }
}
