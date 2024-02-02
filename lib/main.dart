import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/core/global.dart';
import 'package:flutter_cryptoapp/src/core/style/app_theme.dart';
import 'package:flutter_cryptoapp/src/pages/details/coin_detail.dart';
import 'package:flutter_cryptoapp/src/pages/home/homepage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const CoinDetailScreen(),
      builder: EasyLoading.init(),
    );
  }
}
