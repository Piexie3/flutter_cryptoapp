import 'package:flutter_cryptoapp/src/pages/coin/coins/controller.dart';
import 'package:flutter_cryptoapp/src/pages/coin/details/controller.dart';
import 'package:get/get.dart';

void init() {
  Get.lazyPut(() => CoinsController());
  Get.lazyPut(() => DetailsController());
}
