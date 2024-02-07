import 'package:dio/dio.dart';
import 'package:flutter_cryptoapp/src/core/utils/http.dart';
import 'package:flutter_cryptoapp/src/core/utils/loading.dart';
import 'package:flutter_cryptoapp/src/pages/models/coin_detail.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  var isLoading = false.obs;
  CoinDetails? coins;

  @override
  Future<void> onInit() async {
    super.onInit();
    getAllCoinsDetails();
  }

  Future<void> getAllCoinsDetails() async {
    isLoading.value = true;
    print("DetailsController");
    Loading.show();
    try {
      var res = await HttpUtil().get(
        "coins/eth-ethereum",
      );
      print("data: $res");
      coins = CoinDetails.fromJson(res);
      Loading.dismiss();
      isLoading.value = false;
    } on DioException catch (e) {
      Loading.showError(e.message!);
    }
  }
}
