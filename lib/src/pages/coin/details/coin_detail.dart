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
  Future<CoinDetail>? _coindetail;
  @override
  void initState() {
    super.initState();
    _coindetail = fetchCoinDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<CoinDetail>(
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
                          "(${data?.symbol ?? ""})",
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
                            color: data?.type == "coin"
                                ? Colors.white30
                                : Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            data?.type ?? "",
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
                  ),
                  SliverToBoxAdapter(
                    child: Wrap(
                      children: List.generate(
                        data?.tags?.length ?? 0,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 7,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.purple,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            data?.tags?[index].name ?? "",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Links",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          LinkWidget(
                            text: "Explore",
                            ontap: () {},
                          ),
                          LinkWidget(
                            text: "Facebook",
                            ontap: () {},
                          ),
                          LinkWidget(
                            text: "Reddit",
                            ontap: () {},
                          ),
                          LinkWidget(
                            text: "Source code",
                            ontap: () {},
                          ),
                          LinkWidget(
                            text: "Website",
                            ontap: () {},
                          ),
                          LinkWidget(
                            text: "Youtube",
                            ontap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Team",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: List.generate(
                        data?.team?.length ?? 0,
                        (index) => ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white12,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            data?.team?[index].name ?? "",
                          ),
                          subtitle: Text(
                            data?.team?[index].position ?? "",
                          ),
                        ),
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

  Future<CoinDetail> fetchCoinDetail() async {
    final response = await http
        .get(Uri.parse('https://api.coinpaprika.com/v1/coins/${widget.id}'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CoinDetail.fromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class LinkWidget extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const LinkWidget({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
