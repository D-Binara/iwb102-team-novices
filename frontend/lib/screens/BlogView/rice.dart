import 'package:flutter/material.dart';

class RicePage extends StatelessWidget {
  const RicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sri Lanka Rice Prices"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Set the image inside a SizedBox with fixed height
            SizedBox(
              width: double.infinity, // Match the width of the phone screen
              height: 200, // Fixed height for all images
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Optional rounded corners
                child: Image.asset(
                  'assets/Blog/sri_lanka_rice.jpg',
                  fit: BoxFit.cover, // Ensure the image covers the entire box
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Sri Lanka Rice Prices Stabilize After Harvest Season",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              " Sri Lanka’s 2024 rice harvest has been abundant, stabilizing local market prices. "
                  "While the international price of rice has risen due to shortages in other regions, "
                  "local prices in Sri Lanka remain steady at around LKR 95 per kilogram. The government’s"
                  " strategic support for rice farmers, including subsidies and irrigation projects, has "
                  "contributed to a strong harvest, which is meeting both local and export demands. Farmers "
                  "are optimistic, though they are keeping an eye on global price trends that could affect their "
                  "competitiveness on the export front.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              " The introduction of new rice varieties and innovative farming methods has also played a role in "
                  "enhancing productivity. Despite steady local prices, farmers are concerned about climate change, "
                  "as irregular rainfall patterns in the past have disrupted harvests. The government is encouraging "
                  "more sustainable water management practices, and some farmers are exploring organic rice production "
                  "to tap into higher-priced niche markets. Overall, the rice sector in Sri Lanka remains resilient, "
                  "but vigilance is necessary to address potential environmental and global market challenges.",
              style: TextStyle(fontSize: 16),
            ),
            // Add more content here
          ],
        ),
      ),
      ),
    );

  }
}
