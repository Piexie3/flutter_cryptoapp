import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cryptoapp/src/core/utils/http.dart';
import 'package:flutter_cryptoapp/src/core/utils/loading.dart';
import 'package:flutter_cryptoapp/src/pages/models/coin_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailsController extends GetxController {
  var isLoading = false.obs;
  CoinDetails? coins;

  Future<CoinDetails> fetchCoinDetail(String id) async {
    final response =
        await http.get(Uri.parse('https://api.coinpaprika.com/v1/coins/$id'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CoinDetails.fromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
