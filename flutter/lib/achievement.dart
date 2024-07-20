import 'package:flutter/material.dart';
import 'package:soul_mad/to-do.dart';
import 'chatstarted.dart'; // Import your ChatStarted screen from the correct file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AchievementsPage(),
      routes: {
        '/chat': (context) => ChatStarted(), // Use ChatStarted from chatstarted.dart
        '/to-do': (context) => ToDoScreen(),
      },
    );
  }
}

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              'My Achievements',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            SizedBox(width: 5),
            Icon(Icons.emoji_events, color: Colors.orange, size: 40),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF8EFE3),
        child: ListView(
          padding: EdgeInsets.all(7.0),
          children: [
            AchievementCard(
              doctor: 'Dr. Peter',
              duration: '01/03/24 - 01/04/24',
            ),
            AchievementCard(
              doctor: 'Dr. Singhaniya',
              duration: '15/01/24 - 15/02/24',
            ),
            AchievementCard(
              doctor: 'Dr. Murli',
              duration: '11/09/23 - 11/12/23',
            ),
            AchievementCard(
              doctor: 'Dr. Jack',
              duration: '01/01/23 - 01/06/23',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final String doctor;
  final String duration;

  AchievementCard({required this.doctor, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.brown, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Increased padding
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Congratulations! you have made it.',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 18, // Increased font size
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Session', style: TextStyle(fontSize: 16)),
                  Text('Doctor : $doctor', style: TextStyle(fontSize: 16)),
                  Text('Duration : $duration', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, '/chat');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/to-do');
    } else if (index == 0) {
      Navigator.pushNamed(context, '/to-do');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTap,
      backgroundColor: Color(0xFF9EBEF6),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 38, color: Colors.brown),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_rounded, size: 38, color: Colors.brown),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create, size: 38, color: Colors.brown),
          label: 'Reviews',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule, size: 38, color: Colors.brown),
          label: 'Todo List',
        ),
      ],
    );
  }
}
