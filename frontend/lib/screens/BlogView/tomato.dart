import 'package:flutter/material.dart';

class TomatoPage extends StatelessWidget {
  const TomatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomato Prices"),
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
                  'assets/Blog/tomato.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Tomato Prices Fall Due to High Yield",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              "Tomato prices have dropped to LKR 50 per kilogram, compared to LKR 80 at the start of the year, "
                  "thanks to an exceptionally high yield in 2024. Favorable weather conditions and advancements in farming practices have "
                  "led to an oversupply in local markets. While consumers enjoy the price decrease, farmers are facing financial pressure "
                  "due to the excess supply and reduced revenue. Many are advocating for export options or government support to alleviate "
                  "the financial burden caused by low prices.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "The tomato industry is seeing significant interest in value-added products such as tomato sauces, canned tomatoes, and dried tomatoes, "
                  "which could provide farmers with additional revenue streams. The excess supply of tomatoes has also led to collaborations with food "
                  "processing companies to create products that can be sold in both local and international markets. Despite the current price slump, these "
                  "efforts may help stabilize the industry and ensure that farmers can continue to profit from their high yields.",
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
