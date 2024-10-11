import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/screens/Profile_Page.dart';

class ItemDetailPage extends StatefulWidget {
  final String title;
  final String location;
  final String price;
  final List<String> images;
  final String description;

  const ItemDetailPage({
    Key? key,
    required this.title,
    required this.location,
    required this.price,
    required this.images,
    required this.description,
  }) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 2), (timer) {
        if (_currentIndex < widget.images.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(widget.images[index],
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color:
                          _currentIndex == index ? Colors.green : Colors.black,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Space between title and button
                      ElevatedButton(
                        onPressed: () {
                          // Add action for 'BUY' button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          'BUY',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4), // Add space below title
                  Text(
                    widget.location,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.price,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "CONTACT THE SELLER",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile_placeholder.png',
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Expanded(
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 92, vertical: 12),
                  ),
                  child: const Text(
                    'Call',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
