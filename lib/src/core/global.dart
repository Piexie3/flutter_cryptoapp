import 'package:flutter_cryptoapp/src/pages/home/controller.dart';
import 'package:get/get.dart';

void init() {
  Get.lazyPut(() => HomeController());
}
