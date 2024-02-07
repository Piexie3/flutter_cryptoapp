import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/pages/coin/coins/controller.dart';
import 'package:get/get.dart';

class Coinlist extends GetView<CoinsController> {
  const Coinlist({super.key});
//   void search(String query) {
//   // Filter the list of coins based on the query
//   var results = coins.where((coin) => coin.name.contains(query)).toList();

//   // Update the state to reflect the search results
//   searchResults.value = results;
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? Container()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: false,
                  title: const Text(
                    "Coins",
                    style: TextStyle(
                      fontFamily: "Robonto",
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  bottom: AppBar(
                    centerTitle: true,
                    title: SearchBar(
                      hintText: "Search...",
                      onSubmitted: (searchResult) {},
                      trailing: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search))
                      ],
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Bitcoin",
                              style: TextStyle(
                                fontFamily: "Robonto",
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text("COIN"),
                            )
                          ],
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "B",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Positioned(
                                  child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  shape: BoxShape.circle,
                                ),
                                child: Text("$index"),
                              ))
                            ],
                          ),
                        ),
                        subtitle: const Text(
                          "BTC",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            )),
    );
  }
}
