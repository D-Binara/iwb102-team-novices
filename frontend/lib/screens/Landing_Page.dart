import 'package:flutter/cupertino.dart'; // For CupertinoPageRoute
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _zoomOutAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration for zoom out animation
      vsync: this,
    );

    _zoomOutAnimation = Tween<double>(begin: 1.0, end: 0.1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

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

class _SecondScreenState extends State<SecondScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _zoomInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duration for zoom in animation
      vsync: this,
    );

    _zoomInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Start the zoom-in animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Stack( // Use Stack to position the icon
          children: [
            Center(
              child: ScaleTransition(
                scale: _zoomInAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To avoid taking extra vertical space
                  children: [
                    // This reduces the space above the image and text
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 380),
                      child: Image.asset('assets/Landing/onboarding_1.png'),
                    ),
                    const SizedBox(height: 20), // Adjust space between image and title

                    // Title text
                    Text(
                      'Welcome to Agriplant',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 30), // Adjusted padding
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
              bottom: 20, // Distance from the bottom of the screen
              right: 20, // Distance from the right of the screen
              child: GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  padding: const EdgeInsets.all(10), // Padding around the icon
                  decoration: BoxDecoration(
                    color: Colors.white70, // Background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12, // Color of the shadow
                        offset: const Offset(0, 4), // Shadow position (x, y)
                        blurRadius: 6, // Spread of the shadow
                        spreadRadius: 2, // Increase shadow size
                      ),
                    ],
                  ),
                  child: const Text(
                    '>>>', // The custom icon
                    style: TextStyle(
                      fontSize: 24, // Size of the icon text
                      color: Colors.black, // Color of the icon text
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


