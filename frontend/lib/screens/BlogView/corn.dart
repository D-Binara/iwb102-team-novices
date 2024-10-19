import 'package:flutter/material.dart';

class CornPage extends StatelessWidget {
  const CornPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corn Prices"),
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
                  'assets/Blog/corn.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Corn Prices Stable Amid Steady Domestic Demand",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            const Text(
              "In 2024, Sri Lanka’s corn market has maintained stability due to consistent domestic demand. "
                  "While global corn prices have fluctuated because of supply chain disruptions and adverse weather conditions "
                  "in key producing regions, local prices remain steady at around LKR 85 per kilogram. The government's agricultural policies, "
                  "such as seed subsidies and improved irrigation infrastructure, have supported local corn farmers, leading to consistent "
                  "yields that meet domestic consumption needs.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Farmers are cautiously optimistic about the current season but remain mindful of global market volatility, "
                  "which could impact the competitiveness of Sri Lankan corn in export markets. Additionally, new corn varieties "
                  "and advancements in farming techniques have contributed to higher productivity, helping farmers manage costs despite "
                  "external pressures. However, concerns about climate change, particularly irregular rainfall and drought, remain. The "
                  "government is encouraging farmers to adopt more sustainable practices, including crop rotation and organic farming, to "
                  "ensure long-term viability and access to premium markets. While the sector shows resilience, continued focus on sustainability and global trends is essential for maintaining stability.",
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
