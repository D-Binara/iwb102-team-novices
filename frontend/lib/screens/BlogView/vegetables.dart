import 'package:flutter/material.dart';

class VegetablesPage extends StatelessWidget {
  const VegetablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vegetable Prices Drop"),
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
                  'assets/Blog/vegetables.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Vegetable Prices Drop After Local Supply Increase",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              "Vegetable prices have dropped by an average of 10% in 2024, thanks to a "
                  "substantial increase in local production. Key vegetables like carrots, tomatoes, "
                  "and cabbages are now selling at prices lower than LKR 75 per kilogram, compared to LKR 90 earlier in the year. "
                  "The bumper harvest, fueled by favorable weather conditions and enhanced farming techniques, has provided consumers "
                  "with cheaper vegetables. However, the oversupply has caused some financial strain on farmers, who are selling their "
                  "produce at lower-than-expected prices.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "The government and farmer cooperatives are now looking at export opportunities to absorb the excess production and stabilize prices. "
                  "There is also an emphasis on processing surplus vegetables into value-added products like canned goods and sauces, which could help "
                  "farmers earn more revenue. While local consumers are benefiting from the lower prices, long-term solutions such as improved cold storage "
                  "facilities and logistics for exports will be key to ensuring that farmers can consistently profit from their harvests without relying solely on domestic markets.",
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
