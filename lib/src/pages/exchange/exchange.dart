import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: const Text(
              "Exchange",
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
        ],
      ),
    );
  }
}
