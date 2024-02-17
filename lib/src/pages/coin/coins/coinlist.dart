import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/pages/coin/coins/widgets/coin_card.dart';
import 'package:flutter_cryptoapp/src/pages/coin/details/coin_detail.dart';
import 'package:flutter_cryptoapp/src/pages/conversion/conversion.dart';
import 'package:flutter_cryptoapp/src/pages/conversion/exchange_page.dart';
import 'package:flutter_cryptoapp/src/pages/models/coin.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Coinlist extends StatefulWidget {
  const Coinlist({super.key});

  @override
  State<Coinlist> createState() => _CoinlistState();
}

class _CoinlistState extends State<Coinlist> {
  Future<List<Coin>>? _cryptocurrencyData;

  @override
  void initState() {
    super.initState();
    // Choose whether to fetch data from API or use static data
    _cryptocurrencyData = fetchData(); // Or: List.of(cryptocurrencyData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Coin>>(
        future: _cryptocurrencyData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final coin = snapshot.data!;
            return CustomScrollView(
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
                  actions: [
                    IconButton(
                      onPressed: () => Get.to(const ConversionScreen()),
                      icon: const Icon(
                        Icons.currency_exchange,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.to(const Exchangecreen()),
                      icon: const Icon(
                        Icons.change_circle,
                      ),
                    ),
                  ],
                  bottom: AppBar(
                    centerTitle: true,
                    title: SearchBar(
                      hintText: "Search...",
                      onSubmitted: (searchResult) {},
                      trailing: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: coin.length,
                  itemBuilder: (context, index) {
                    final data = coin[index];
                    return GestureDetector(
                      onTap: () => Get.to(
                        CoinDetailScreen(
                          id: data.id,
                        ),
                      ),
                      child: CoinCard(
                        data: data,
                      ),
                    );
                  },
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<List<Coin>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.coinpaprika.com/v1/coins'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      // print("...json data : $json ...");
      return json.map((e) => Coin.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
