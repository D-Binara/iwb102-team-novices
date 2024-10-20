import 'package:flutter/material.dart';

class TeaPage extends StatelessWidget {
  const TeaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ceylon Tea Prices"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView( // Enables scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/Blog/ceylon_tea.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16), // Space between sections

              // Title section
              const Text(
                "Ceylon Tea Prices Surge Amid Global Demand",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10), // Space between title and content

              // First paragraph
              const Text(
                "The global demand for Ceylon tea has surged in 2024, leading to record-breaking export prices. "
                    "Tea prices have increased by 15% compared to last year, with premium quality tea now fetching around "
                    "USD6.50 per kilogram. This price hike is largely driven by increasing demand in Europe and the Middle East, "
                    "coupled with a relatively lower supply from other major producers like India and Kenya. Sri Lankan tea farmers are "
                    "enjoying higher profits, but the rising costs pose challenges for international buyers who must contend with these elevated "
                    "prices to meet market demand. The Sri Lankan government is working on strategies to further enhance production while maintaining "
                    "the high standards of Ceylon tea.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16), // Space between paragraphs

              // Second paragraph
              const Text(
                "In addition to market demand, the quality of Ceylon tea has been a significant factor in pushing prices higher. "
                    "The unique flavor and quality that comes from Sri Lanka’s specific soil and climatic conditions make this tea a "
                    "favorite worldwide. However, challenges such as labor shortages and rising production costs due to inflation may impact "
                    "future pricing trends. Efforts are being made to mechanize certain aspects of the tea-picking process to reduce dependency "
                    "on labor and ensure consistent supply. The future looks bright for Ceylon tea as exporters focus on entering new markets and "
                    "promoting premium blends to sustain growth.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16), // Space for more paragraphs or sections

              // You can add additional paragraphs or details here

            ],
          ),
        ),
      ),
    );
  }
}
