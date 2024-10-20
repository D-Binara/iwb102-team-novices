import 'package:flutter/material.dart';

class CarrotPage extends StatelessWidget {
  const CarrotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrot Prices"),
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
                  'assets/Blog/carrot.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Carrot Prices Fall Due to High Yield",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              "Carrot prices have dropped significantly, with the current market rate at LKR 60 per "
                  "kilogram, down from LKR 85 earlier in the year. This price reduction follows an abundant harvest in 2024, "
                  "largely due to favorable growing conditions. While consumers are benefitting from cheaper carrots, farmers are "
                  "feeling the pressure of reduced profits. Many are hoping for government intervention to stabilize prices through "
                  "subsidies or export promotions, as local markets become saturated with excess supply.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Moving forward, carrot farmers are looking to diversify their crops and explore more sustainable "
                  "farming techniques to hedge against the unpredictability of vegetable pricing. There are also efforts "
                  "to form cooperatives that can collectively negotiate better pricing and distribution channels. Value-added "
                  "processing, such as producing carrot juice or snacks, is another avenue farmers are exploring to stabilize their "
                  "income streams and reduce the impact of price fluctuations during bumper harvests.",
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
