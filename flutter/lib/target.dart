import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TargetScreen(),
    );
  }
}

class TargetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen (HomeScreen)
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/david.jpg'),
                  radius: 40,
                ),
                SizedBox(width: 20),
                Text(
                  'Hi! Alex',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Your today\'s targets',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            TargetCard(
              imagePath: 'assets/images/running.png',
              value: '2.3',
              unit: 'kms',
              description: 'Running distance',
            ),
            SizedBox(height: 20),
            TargetCard(
              imagePath: 'assets/images/yoga.png',
              value: '45',
              unit: 'mins',
              description: 'Yoga Time',
            ),
            SizedBox(height: 20),
            TargetCard(
              imagePath: 'assets/images/medTarg.png',
              value: '15',
              unit: 'mins',
              description: 'Meditation Time',
            ),
            SizedBox(height: 20),
            TargetCard(
              imagePath: 'assets/images/water.png',
              value: '8',
              unit: 'glasses',
              description: 'drink water',
            ),
          ],
        ),
      ),
    );
  }
}

class TargetCard extends StatelessWidget {
  final String imagePath;
  final String value;
  final String unit;
  final String description;

  TargetCard({
    required this.imagePath,
    required this.value,
    required this.unit,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 100,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 90),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$value $unit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
