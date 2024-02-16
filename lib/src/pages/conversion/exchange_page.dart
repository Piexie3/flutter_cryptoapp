import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/pages/models/exchange.dart';
import 'package:http/http.dart' as http;

class Exchangecreen extends StatefulWidget {
  const Exchangecreen({super.key});

  @override
  State<Exchangecreen> createState() => _ExchangecreenState();
}

class _ExchangecreenState extends State<Exchangecreen> {
  Future<List<Exchange>>? _exchangeData;

  @override
  void initState() {
    super.initState();
    // Choose whether to fetch data from API or use static data
    _exchangeData = fetchData(); // Or: List.of(cryptocurrencyData);
    print("... exchangedata : $_exchangeData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Exchanges",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Exchange>>(
        future: _exchangeData,
        builder: (context, snapshot) {
          print("snapshot $snapshot");
          if (snapshot.hasData) {
            final exchange = snapshot.data!;
            return Column(
              children: List.generate(
                exchange.length,
                (index) => Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            exchange[index].name ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: exchange[index].active == true
                                  ? Colors.greenAccent[200]
                                  : Colors.redAccent[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              exchange[index].active == true
                                  ? "Active"
                                  : "Inactive",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text("Adjusted Rank"),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    exchange[index].adjustedRank.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Reported Rank"),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    exchange[index].reportedRank.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Markets"),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    exchange[index].markets.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Currencies"),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    exchange[index].currencies.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
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

  Future<List<Exchange>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.coinpaprika.com/v1/exchanges'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => Exchange.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
