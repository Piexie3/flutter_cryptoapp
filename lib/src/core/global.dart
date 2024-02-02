import 'package:flutter_cryptoapp/src/pages/details/controller.dart';
import 'package:flutter_cryptoapp/src/pages/home/controller.dart';
import 'package:get/get.dart';

void init() {
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => DetailsController());
}
