import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/core/style/colors.dart';
import 'package:flutter_cryptoapp/src/pages/home/controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? Container()
          : CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text("CryptoApp"),
                ),
                SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.scaffoldBackground,
                        border: Border.all(
                          color: AppColor.secondaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColor.secondaryColor,
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            // controller.coins?[index].name ?? "",
                            "Bitcoin",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            )),
    );
  }
}
