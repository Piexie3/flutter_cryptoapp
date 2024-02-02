import 'package:dio/dio.dart';
import 'package:flutter_cryptoapp/src/core/utils/http.dart';
import 'package:flutter_cryptoapp/src/core/utils/loading.dart';
import 'package:flutter_cryptoapp/src/pages/models/coin.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  Coin? coins;

  @override
  Future<void> onInit() async {
    super.onInit();
    getAllCoins();
  }

  Future<void> getAllCoins() async {
    isLoading.value = true;
    Loading.show();
    try {
      var res = await HttpUtil().get(
        "coins",
      );
      print("data: $res");
      coins = Coin.fromJson(res);
      Loading.dismiss();
      isLoading.value = false;
    } on DioException catch (e) {
      Loading.showError(e.message!);
    }
  }
}
