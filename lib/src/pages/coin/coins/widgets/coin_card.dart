import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final int index;
  const CoinCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Bitcoin",
              style: TextStyle(
                fontFamily: "Robonto",
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "COIN",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
        leading: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.white12,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "B",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
              Positioned(
                  top: 5,
                  right: 0,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "$index",
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        subtitle: const Text(
          "BTC",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
