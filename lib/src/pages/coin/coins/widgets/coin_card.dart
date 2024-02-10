import 'package:flutter/material.dart';
import 'package:flutter_cryptoapp/src/pages/models/coin.dart';

class CoinCard extends StatelessWidget {
  final Coin data;
  const CoinCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Text(
                data.name,
                style: const TextStyle(
                  fontFamily: "Robonto",
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color:
                    data.type == "coin" ? Colors.white24 : Colors.greenAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                (data.type).toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
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
            Align(
              alignment: Alignment.center,
              child: Text(
                data.name.characters.first,
                style: const TextStyle(
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
                    color: Colors.white38,
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      (data.rank).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
      subtitle: Text(
        data.symbol,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}
