import 'package:flutter/material.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController convert = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Conversion",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextField(
                controller: convert,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "100",
                  label: const Text("Amount"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 54,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Bitcoin",
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 54,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Solana",
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white12,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.currency_exchange_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 65, 169, 221),
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "Convert",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
