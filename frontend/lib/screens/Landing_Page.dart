import 'package:flutter/cupertino.dart'; // For CupertinoPageRoute
import 'package:flutter/material.dart';
import 'dart:async'; // For Timer

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _zoomOutAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration for zoom out animation
      vsync: this,
    );

    _zoomOutAnimation = Tween<double>(begin: 1.0, end: 0.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // Start the zoom-out animation after a delay
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward().whenComplete(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SecondScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _zoomOutAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Text
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 40, // Adjust font size if needed
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Agri',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Market',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Tagline Text
              const Text(
                "Farmer's Choice",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _zoomInAnimation;

  late PageController _pageController; // PageController for PageView
  int _currentPage = 0; // Track current page
  late Timer _timer; // Timer for automatic sliding

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duration for zoom in animation
      vsync: this,
    );

    _zoomInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Initialize the PageController
    _pageController = PageController();

    // Start the zoom-in animation
    _controller.forward();

    // Start the automatic page sliding
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    // Set a timer to navigate to the login page after 6 seconds
    Timer(const Duration(seconds: 15), () {
      // Cancel the sliding timer
      _timer.cancel();
      // Navigate to the LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose(); // Dispose of the PageController
    _timer.cancel(); // Cancel the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Center(
              child: ScaleTransition(
                scale: _zoomInAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Automatic sliding images
                    SizedBox(
                      height: 300, // Set height for the PageView
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Image.asset(
                            'assets/Landing/onboarding_1.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/Landing/onboarding_1.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/Landing/onboarding_1.png',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title text
                    Text(
                      'Welcome to Agriplant',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 30),
                      child: Text(
                        "Get your agriculture products from the comfort of your home. You're just a few clicks away from your favorite products.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(0, 4),
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Text(
                    '>>>', // The custom icon
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
