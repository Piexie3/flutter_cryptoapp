import 'package:flutter/material.dart';

class CoinDetailScreen extends StatelessWidget {
  const CoinDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1682686580950-960d1d513532?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8",
              ),
              radius: 45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("Bitcon"),
                  Text("(BTC)"),
                  Spacer(),
                  Text(
                    "active",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
            SizedBox(
              child: Text(
                  "Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank or single administrator."),
            )
          ],
        ),
      ),
    ));
  }
}
