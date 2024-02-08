import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/core/global.dart';
import 'package:flutter_cryptoapp/src/pages/coin/coins/coinlist.dart';
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
      theme: ThemeData.dark(useMaterial3: true),
      home: const Coinlist(),
      builder: EasyLoading.init(),
    );
  }
}
