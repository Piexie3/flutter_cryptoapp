import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/pages/models/coin_detail.dart';
import 'package:http/http.dart' as http;

class CoinDetailScreen extends StatefulWidget {
  final String id;
  const CoinDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  Future<CoinDetails>? _coindetail;
  @override
  void initState() {
    super.initState();
    _coindetail = fetchCoinDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<CoinDetails>(
          future: _coindetail,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    title: Row(
                      children: [
                        Text(
                          data?.name ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(${data?.symbol})",
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.greenAccent,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            (data?.rank ?? 1).toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            data?.symbol ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(data?.description ?? ""),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Tags",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
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
      ),
    );
  }

  Future<CoinDetails> fetchCoinDetail() async {
    final response = await http
        .get(Uri.parse('https://api.coinpaprika.com/v1/coins/${widget.id}'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CoinDetails.fromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
