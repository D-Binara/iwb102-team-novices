import 'package:flutter/material.dart';
import '../components/SearchBar.dart';
import '../components/NavBar.dart';
import 'BlogView.dart';


class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  static const String sriLankaRice =
      "Sri Lanka’s 2024 rice harvest has been abundant, stabilizing local market prices. "
      "While the international price of rice has risen due to shortages in other regions, "
      "local prices in Sri Lanka remain steady at around LKR 95 per kilogram. The government’s "
      "strategic support for rice farmers, including subsidies and irrigation projects, has "
      "contributed to a strong harvest, which is meeting both local and export demands. Farmers "
      "are optimistic, though they are keeping an eye on global price trends that could affect their "
      "competitiveness on the export front.\n\n"
      "The introduction of new rice varieties and innovative farming methods has also played a role in "
      "enhancing productivity. Despite steady local prices, farmers are concerned about climate change, "
      "as irregular rainfall patterns in the past have disrupted harvests. The government is encouraging "
      "more sustainable water management practices, and some farmers are exploring organic rice production "
      "to tap into higher-priced niche markets. Overall, the rice sector in Sri Lanka remains resilient, "
      "but vigilance is necessary to address potential environmental and global market challenges.";

  static const String CeylonTea =
      "The global demand for Ceylon tea has surged in 2024, leading to record-breaking export prices. "
      "Tea prices have increased by 15% compared to last year, with premium quality tea now fetching around "
      "USD6.50 per kilogram. This price hike is largely driven by increasing demand in Europe and the Middle East, "
      "coupled with a relatively lower supply from other major producers like India and Kenya. Sri Lankan tea farmers are "
      "enjoying higher profits, but the rising costs pose challenges for international buyers who must contend with these elevated "
      "prices to meet market demand. The Sri Lankan government is working on strategies to further enhance production while maintaining "
      "the high standards of Ceylon tea.\n\n"
      "In addition to market demand, the quality of Ceylon tea has been a significant factor in pushing prices higher. "
      "The unique flavor and quality that comes from Sri Lanka’s specific soil and climatic conditions make this tea a "
      "favorite worldwide. However, challenges such as labor shortages and rising production costs due to inflation may impact "
      "future pricing trends. Efforts are being made to mechanize certain aspects of the tea-picking process to reduce dependency "
      "on labor and ensure consistent supply. The future looks bright for Ceylon tea as exporters focus on entering new markets and "
      "promoting premium blends to sustain growth.";

  static const String Pepper =
      "The price of black pepper has seen a significant rise, increasing by 20% compared to 2023. "
      "The current price per kilogram of high-quality Sri Lankan black pepper stands at approximately USD 9.50, "
      "driven by a surge in demand from spice markets in Europe and Asia. Similarly, cinnamon prices have soared by 15%, "
      "now averaging USD 12 per kilogram for premium-grade products. This price hike benefits local spice producers, "
      "although there are concerns that rising costs might reduce consumption in some markets. The government is encouraging "
      "farmers to expand cultivation to meet this growing demand.\n\n"
      "Sri Lanka’s position as a leading exporter of spices like pepper and cinnamon is underpinned by the global trend "
      "toward natural and organic products. Consumers are increasingly favoring natural spices over synthetic flavors, "
      "which is boosting demand for Sri Lankan products. However, producers must contend with volatile market prices and "
      "competition from other spice-producing nations like Vietnam and Indonesia. The focus on maintaining quality and organic "
      "certification will be crucial for Sri Lanka’s spice industry to continue thriving and commanding premium prices in international markets.";

  static const String Cinnamon =
      "Farmers are benefiting from the price hike, but they face challenges in meeting demand due to labor shortages and "
      "climate-related disruptions, such as irregular rainfall and soil degradation. The government has initiated efforts "
      "to support cinnamon cultivators through training programs focused on sustainable farming practices and enhancing processing "
      "methods to improve product quality. Despite these challenges, the outlook for the cinnamon industry remains positive, with the "
      "potential for further growth in export markets, particularly as global consumers continue to favor organic and ethically "
      "sourced spices.\n\n"
      "However, experts warn that continued investment in sustainable cultivation and better infrastructure is crucial to maintaining the "
      "industry’s growth, as over-reliance on current market conditions could expose the sector to future risks, such as global price "
      "volatility and environmental concerns.";

  static const String Fish =
      " Fresh tuna prices have declined by 8% in 2024, following a substantial increase in supply. "
      "The current price of fresh tuna in local markets is approximately LKR 800 per kilogram, down "
      "from LKR 870 earlier this year. This drop is due to a bumper catch by Sri Lankan fishermen, "
      "helping to stabilize prices and making tuna more affordable for local consumers. The quality of"
      " the tuna remains high, and exporters are still seeing strong demand from international markets, "
      "though the price reduction is most noticeable in domestic sales.\n\n"
      "Fisheries officials are working on sustainable fishing methods to ensure that the surge in tuna supply "
      "does not negatively impact fish populations. There is also a push to improve cold storage and transportation "
      "infrastructure, allowing fish to be exported to high-value markets without compromising quality. While local "
      "consumers are benefiting from lower prices, Sri Lankan fishermen are looking to further expand into the lucrative "
      "international market, particularly in Europe and Japan, where demand for sustainably caught, premium-quality tuna remains strong. ";

  static const String Tomato =
      "Tomato prices have dropped to LKR 50 per kilogram, compared to LKR 80 at the start of the year, "
      "thanks to an exceptionally high yield in 2024. Favorable weather conditions and advancements in farming practices have "
      "led to an oversupply in local markets. While consumers enjoy the price decrease, farmers are facing financial pressure "
      "due to the excess supply and reduced revenue. Many are advocating for export options or government support to alleviate "
      "the financial burden caused by low prices.\n\n"
      "The tomato industry is seeing significant interest in value-added products such as tomato sauces, canned tomatoes, and dried tomatoes, "
      "which could provide farmers with additional revenue streams. The excess supply of tomatoes has also led to collaborations with food "
      "processing companies to create products that can be sold in both local and international markets. Despite the current price slump, these "
      "efforts may help stabilize the industry and ensure that farmers can continue to profit from their high yields.";

  static const String Carrot =
      "Carrot prices have dropped significantly, with the current market rate at LKR 60 per "
      "kilogram, down from LKR 85 earlier in the year. This price reduction follows an abundant harvest in 2024, "
      "largely due to favorable growing conditions. While consumers are benefitting from cheaper carrots, farmers are "
      "feeling the pressure of reduced profits. Many are hoping for government intervention to stabilize prices through "
      "subsidies or export promotions, as local markets become saturated with excess supply.\n\n"
      "Moving forward, carrot farmers are looking to diversify their crops and explore more sustainable "
      "farming techniques to hedge against the unpredictability of vegetable pricing. There are also efforts "
      "to form cooperatives that can collectively negotiate better pricing and distribution channels. Value-added "
      "processing, such as producing carrot juice or snacks, is another avenue farmers are exploring to stabilize their "
      "income streams and reduce the impact of price fluctuations during bumper harvests.";

  static const String Mango =
      "The export price of mangoes has skyrocketed in 2024, with premium "
      "varieties fetching up to USD 3.50 per kilogram. The sharp increase, up by 25% "
      "compared to 2023, is a result of strong demand from the Middle East and Europe. With limited "
      "global supply due to weather challenges in other mango-producing countries, Sri Lankan exporters are "
      "benefitting from this price surge. Domestically, prices have also increased to LKR 200 per kilogram, "
      "causing some concern among local consumers. Exporters are looking to capitalize on this opportunity while "
      "balancing local market needs.\n\n"
      "Mango growers in Sri Lanka are now focusing on improving post-harvest handling and packaging to ensure that "
      "their fruit meets international quality standards. Many farmers are exploring organic certification to tap "
      "into the growing market for organic produce, which commands even higher prices. However, local consumers are "
      "feeling the pinch as prices rise due to the focus on exports. The government is working on strategies to ensure "
      "sufficient local supply while enabling exporters to take advantage of the lucrative international market for "
      "premium Sri Lankan mangoes.";

  static const String Corn =
      "In 2024, Sri Lanka’s corn market has maintained stability due to consistent domestic demand. "
      "While global corn prices have fluctuated because of supply chain disruptions and adverse weather conditions "
      "in key producing regions, local prices remain steady at around LKR 85 per kilogram. The government's agricultural policies, "
      "such as seed subsidies and improved irrigation infrastructure, have supported local corn farmers, leading to consistent "
      "yields that meet domestic consumption needs.\n\n"
      "Farmers are cautiously optimistic about the current season but remain mindful of global market volatility, "
      "which could impact the competitiveness of Sri Lankan corn in export markets. Additionally, new corn varieties "
      "and advancements in farming techniques have contributed to higher productivity, helping farmers manage costs despite "
      "external pressures. However, concerns about climate change, particularly irregular rainfall and drought, remain. The "
      "government is encouraging farmers to adopt more sustainable practices, including crop rotation and organic farming, to "
      "ensure long-term viability and access to premium markets. While the sector shows resilience, continued focus on sustainability and global trends is essential for maintaining stability.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Blog Page", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(),
          ),
          Container(
            height: 168,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Sri Lanka Rice",
                          content: sriLankaRice, // Use the defined content here
                          imageUrl: 'assets/Blog/sri_lanka_rice.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/sri_lanka_rice.jpg',
                    title:
                        'Sri Lanka Rice Prices Stabilize After Harvest Season',
                    views: '3500 views',
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Ceylon Tea",
                          content: CeylonTea,
                          imageUrl: 'assets/Blog/ceylon_tea.jpeg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/ceylon_tea.jpeg',
                    title: 'Ceylon Tea Prices Surge Amid Global Demand',
                    views: '4200 views',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Pepper",
                          content: Pepper,
                          imageUrl: 'assets/Blog/pepper.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/pepper.jpg',
                    title: 'Sri Lankan Spices: Pepper and Cinnamon Prices',
                    views: '2900 views',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Cinnamon",
                          content: Cinnamon,
                          imageUrl: 'assets/Blog/cinnamon.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/cinnamon.jpg',
                    title: 'Cinnamon Prices in Sri Lanka Continue to Soar',
                    views: '3200 views',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Fish",
                          content: Fish,
                          imageUrl: 'assets/Blog/fish.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/fish.jpg',
                    title: 'Fresh Tuna Prices Decline After Increase in Supply',
                    views: '2500 views',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Tomato",
                          content: Tomato,
                          imageUrl: 'assets/Blog/tomato.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/tomato.jpg',
                    title: 'Tomato Prices Fall Due to High Yield',
                    views: '3100 views',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Carrot",
                          content: Carrot,
                          imageUrl: 'assets/Blog/carrot.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/carrot.jpg',
                    title: 'Carrot Prices Fall Due to High Yield',
                    views: '3100 views',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Mango",
                          content: Mango,
                          imageUrl: 'assets/Blog/mango.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/mango.jpg',
                    title: 'Fruit Exports: Mango and Banana Prices Surge',
                    views: '2700 views',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Corn",
                          content: Corn,
                          imageUrl: 'assets/Blog/corn.jpg',
                        ),
                      ),
                    );
                  },
                  child: const MostViewedItem(
                    imageUrl: 'assets/Blog/corn.jpg',
                    title: 'Corn Prices Stable Amid Steady Domestic Demand',
                    views: '2800 views',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Ceylon Tea",
                          content: CeylonTea,
                          imageUrl: 'assets/Blog/ceylon_tea.jpeg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/ceylon_tea.jpeg',
                    title: 'Ceylon Tea Export Prices Hit Record Highs',
                    price: 'LKR 1,200/kg',
                    date: 'Oct 8, 2024',
                    views: '4200 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Sri Lanka Rice",
                          content: sriLankaRice,
                          imageUrl: 'assets/Blog/sri_lanka_rice.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/sri_lanka_rice.jpg',
                    title: 'Local Rice Prices Steady Amid Strong Harvest',
                    price: 'LKR 110/kg',
                    date: 'Oct 7, 2024',
                    views: '3500 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Pepper",
                          content: Pepper,
                          imageUrl: 'assets/Blog/pepper.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/pepper.jpg',
                    title: 'Pepper and Cinnamon Prices Rise in 2024',
                    price: 'LKR 950/kg',
                    date: 'Oct 6, 2024',
                    views: '2900 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Cinnamon",
                          content: Cinnamon,
                          imageUrl: 'assets/Blog/cinnamon.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/cinnamon.jpg',
                    title: 'Cinnamon Prices in Sri Lanka Continue to Soar',
                    price: 'LKR 3,500/kg',
                    date: 'Oct 7, 2024',
                    views: '3200 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Fish",
                          content: Fish,
                          imageUrl: 'assets/Blog/fish.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/fish.jpg',
                    title: 'Fresh Tuna Prices Decline After Increase in Supply',
                    price: 'LKR 1500/kg',
                    date: 'Oct 8, 2024',
                    views: '2500 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Tomato",
                          content: Tomato,
                          imageUrl: 'assets/Blog/tomato.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/tomato.jpg',
                    title: 'Tomato Prices Fall Due to High Yield',
                    price: 'LKR 90/kg',
                    date: 'Oct 9, 2024',
                    views: '3100 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Carrot",
                          content: Carrot,
                          imageUrl: 'assets/Blog/carrot.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/carrot.jpg',
                    title: 'Carrot Prices Fall Due to High Yield',
                    price: 'LKR 90/kg',
                    date: 'Oct 9, 2024',
                    views: '3100 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Mango",
                          content: Mango,
                          imageUrl: 'assets/Blog/mango.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/mango.jpg',
                    title: 'Mango Exports Reach Record Prices in 2024',
                    price: 'LKR 200/kg',
                    date: 'Oct 10, 2024',
                    views: '2700 views',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlogView(
                          title: "Corn",
                          content: Corn,
                          imageUrl: 'assets/Blog/corn.jpg',
                        ),
                      ),
                    );
                  },
                  child: BlogCard(
                    imageUrl: 'assets/Blog/corn.jpg',
                    title: 'Corn Prices Stable Amid Steady Domestic Demand',
                    price: 'LKR 120/kg',
                    date: 'Oct 10, 2024',
                    views: '2800 views',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class MostViewedItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String views;

  const MostViewedItem({super.key,
    required this.imageUrl,
    required this.title,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imageUrl,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Text(
            views,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String date;
  final String views;

  BlogCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.date,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Text(
                        date,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        views,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
