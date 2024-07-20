import 'package:flutter/material.dart';
import 'chat1.dart'; // Import your chat1.dart file where ChatScreen is defined
import 'chatdiscover.dart'; // Import your chatdiscover.dart file where ChatDiscoverPage is defined


class ChatStarted extends StatelessWidget {
  const ChatStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context); // Handle back button press
                      },
                    ),
                  ),
                  Positioned(
                    top: 16.0,
                    right: 16.0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChatScreen()), // Navigate to ChatScreen
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 290,
                      child: Image.asset(
                        'assets/images/chatstart.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Start The Chat Adventure Jump Into a Heart-to-Heart Connection!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Now is the time to start communicating! Select a friend or guide or a professional to chat.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatDiscoverPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Added spacing below the button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()), // Navigate to ChatScreen
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.blue), // Optional: Add an arrow icon
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
