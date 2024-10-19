import 'package:flutter/material.dart';

class FishPage extends StatelessWidget {
  const FishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fresh Tuna Prices"),
        backgroundColor: Colors.green,
      ),
    body: SingleChildScrollView( // Enables scrolling
    child: Padding(
    padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/Blog/fish.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Fresh Tuna Prices Decline After Increase in Supply",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              " Fresh tuna prices have declined by 8% in 2024, following a substantial increase in supply. "
                  "The current price of fresh tuna in local markets is approximately LKR 800 per kilogram, down "
                  "from LKR 870 earlier this year. This drop is due to a bumper catch by Sri Lankan fishermen, "
                  "helping to stabilize prices and making tuna more affordable for local consumers. The quality of"
                  " the tuna remains high, and exporters are still seeing strong demand from international markets, "
                  "though the price reduction is most noticeable in domestic sales.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Fisheries officials are working on sustainable fishing methods to ensure that the surge in tuna supply "
                  "does not negatively impact fish populations. There is also a push to improve cold storage and transportation "
                  "infrastructure, allowing fish to be exported to high-value markets without compromising quality. While local "
                  "consumers are benefiting from lower prices, Sri Lankan fishermen are looking to further expand into the lucrative "
                  "international market, particularly in Europe and Japan, where demand for sustainably caught, premium-quality tuna remains strong. ",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    ),
    );
  }
}
