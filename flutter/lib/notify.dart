import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold), // Increased font size and added fontWeight
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SectionHeader(title: 'Today'),
          NotificationCard(
            icon: Icons.format_quote,
            message:
            'You are amazing. It\'s not hard just give it a little moment. Smile today.',
            time: '08:00',
          ),
          SectionHeader(title: 'This Week'),
          NotificationCard(
            icon: Icons.login,
            message: 'You have been logged in.',
            time: '16:44',
          ),
          NotificationCard(
            icon: Icons.verified,
            message: 'Congratulations! Your account has been verified.',
            time: '16:42',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Change the initial index as needed
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/main');
              break;
            case 1:
              Navigator.pushNamed(context, '/chat');
              break;
            case 2:
              Navigator.pushNamed(context, '/review');
              break;
            case 3:
              Navigator.pushNamed(context, '/to-do');
              break;
            default:
          }
        },
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
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String message;
  final String time;

  const NotificationCard({
    required this.icon,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF6D89E ), // Set the background color with 15% opacity
      margin: EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20.0),
            Expanded(
              child: Text(
                message,
                style: TextStyle(fontSize: 18.0), // Increase font size
              ),
            ),
            Text(time),
          ],
        ),
      ),
    );
  }
}
