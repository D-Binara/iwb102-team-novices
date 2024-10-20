import 'package:flutter/material.dart';

class PepperPage extends StatelessWidget {
  const PepperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pepper and Cinnamon Prices"),
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
                  'assets/Blog/pepper.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Sri Lankan Spices: Pepper and Cinnamon Prices",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              "The price of black pepper has seen a significant rise, increasing by 20% compared to 2023. "
                  "The current price per kilogram of high-quality Sri Lankan black pepper stands at approximately USD 9.50, "
                  "driven by a surge in demand from spice markets in Europe and Asia. Similarly, cinnamon prices have soared by 15%, "
                  "now averaging USD 12 per kilogram for premium-grade products. This price hike benefits local spice producers, "
                  "although there are concerns that rising costs might reduce consumption in some markets. The government is encouraging "
                  "farmers to expand cultivation to meet this growing demand.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Sri Lanka’s position as a leading exporter of spices like pepper and cinnamon is underpinned by the global trend "
                  "toward natural and organic products. Consumers are increasingly favoring natural spices over synthetic flavors, "
                  "which is boosting demand for Sri Lankan products. However, producers must contend with volatile market prices and "
                  "competition from other spice-producing nations like Vietnam and Indonesia. The focus on maintaining quality and organic "
                  "certification will be crucial for Sri Lanka’s spice industry to continue thriving and commanding premium prices in international markets.",
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
