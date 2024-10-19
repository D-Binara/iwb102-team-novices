import 'package:flutter/material.dart';

class CinnamonPage extends StatelessWidget {
  const CinnamonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cinnamon Prices"),
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
                  'assets/Blog/cinnamon.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Cinnamon Prices in Sri Lanka Continue to Soar",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              "Sri Lanka’s cinnamon prices have surged in 2024, driven by high international demand and "
                  "limited global supply. As one of the world’s leading cinnamon producers, Sri Lanka has seen "
                  "local prices climb to approximately LKR 2,200 per kilogram, a significant increase from previous years. "
                  "The rise is fueled by supply chain challenges and crop shortages in competing regions, positioning Sri Lankan "
                  "cinnamon as a premium product in the global market.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Farmers are benefiting from the price hike, but they face challenges in meeting demand due to labor shortages and "
                  "climate-related disruptions, such as irregular rainfall and soil degradation. The government has initiated efforts "
                  "to support cinnamon cultivators through training programs focused on sustainable farming practices and enhancing processing "
                  "methods to improve product quality. Despite these challenges, the outlook for the cinnamon industry remains positive, with the "
                  "potential for further growth in export markets, particularly as global consumers continue to favor organic and ethically "
                  "sourced spices.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "However, experts warn that continued investment in sustainable cultivation and better infrastructure is crucial to maintaining the "
                  "industry’s growth, as over-reliance on current market conditions could expose the sector to future risks, such as global price "
                  "volatility and environmental concerns.",
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
