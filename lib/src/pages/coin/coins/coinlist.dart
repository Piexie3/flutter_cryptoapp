import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/pages/coin/coins/controller.dart';
import 'package:flutter_cryptoapp/src/pages/coin/coins/widgets/coin_card.dart';
import 'package:get/get.dart';

class Coinlist extends StatelessWidget {
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
      body:
          //  Obx(() => controller.isLoading.value
          //     ? Container()
          //     :

          CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: const Text(
              "Coins",
              style: TextStyle(
                fontFamily: "Robonto",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: AppBar(
              centerTitle: true,
              title: SearchBar(
                hintText: "Search...",
                onSubmitted: (searchResult) {},
                trailing: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return CoinCard(
                index: index,
              );
              // return;
            },
          )
        ],
        // ),
      ),
    );
  }
}
