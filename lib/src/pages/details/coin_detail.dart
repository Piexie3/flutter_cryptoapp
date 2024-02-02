import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/core/utils/loading.dart';
import 'package:flutter_cryptoapp/src/pages/details/controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CoinDetailScreen extends GetView<DetailsController> {
  const CoinDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Obx(
        () => controller.isLoading.value
            ? Container()
            : Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      controller.coins?.logo ?? "",
                    ),
                    radius: 45,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(controller.coins?.name ?? ""),
                        Text("(${controller.coins?.symbol})"),
                        Spacer(),
                        Text(
                          controller.coins!.isActive == true
                              ? "active"
                              : "inactive",
                          style: controller.coins!.isActive == true
                              ? TextStyle(color: Colors.green)
                              : TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Text(controller.coins?.description ?? ""),
                  )
                ],
              ),
      )),
    ));
  }
}
