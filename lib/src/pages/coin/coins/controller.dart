import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cryptoapp/src/core/utils/http.dart';
import 'package:flutter_cryptoapp/src/core/utils/loading.dart';
import 'package:flutter_cryptoapp/src/pages/models/coin.dart';
import 'package:get/get.dart';

class CoinsController extends GetxController {
  Future<List<Coin>>? coinDetail;

  Future<List<Coin>> getAllCoins() async {
    try {
      final response = await HttpUtil().get(
        "coins",
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => Coin.fromJson(e)).toList();
    } on DioException catch (e) {
      Loading.showError(e.message!);
      return [];
    }
  }
}
