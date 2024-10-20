import 'package:flutter/material.dart';

class MangoPage extends StatelessWidget {
  const MangoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mango and Banana Prices Surge"),
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
                  'assets/Blog/mango.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Fruit Exports: Mango and Banana Prices Surge",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              "The export price of mangoes has skyrocketed in 2024, with premium "
                  "varieties fetching up to USD 3.50 per kilogram. The sharp increase, up by 25% "
                  "compared to 2023, is a result of strong demand from the Middle East and Europe. With limited "
                  "global supply due to weather challenges in other mango-producing countries, Sri Lankan exporters are "
                  "benefitting from this price surge. Domestically, prices have also increased to LKR 200 per kilogram, "
                  "causing some concern among local consumers. Exporters are looking to capitalize on this opportunity while "
                  "balancing local market needs.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Mango growers in Sri Lanka are now focusing on improving post-harvest handling and packaging to ensure that "
                  "their fruit meets international quality standards. Many farmers are exploring organic certification to tap "
                  "into the growing market for organic produce, which commands even higher prices. However, local consumers are "
                  "feeling the pinch as prices rise due to the focus on exports. The government is working on strategies to ensure "
                  "sufficient local supply while enabling exporters to take advantage of the lucrative international market for "
                  "premium Sri Lankan mangoes.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Additional content can be added here
          ],
        ),
      ),
      ),
    );
  }
}
