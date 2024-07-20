import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyReportPage(),
    );
  }
}

class MyReportPage extends StatelessWidget {
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
          'My Report',
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
          ReportCard(
            title: 'Quiz Assessment',
            host: 'Dr.Priya',
            date: '12-06-2024',
          ),
          ReportCard(
            title: 'Quiz Assessment',
            host: 'Dr.Suman',
            date: '15-07-2024',
          ),
          ReportCard(
            title: 'Personal Session',
            host: 'Dr.Peter',
            date: '15-07-2024',
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
              Navigator.pushNamed(context, '/reviews');
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

class ReportCard extends StatelessWidget {
  final String title;
  final String host;
  final String date;

  const ReportCard({
    Key? key,
    required this.title,
    required this.host,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.brown, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0), // Reduced padding here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0, // Reduced font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0), // Reduced height
            Text(
              'Host: $host',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 2.0), // Reduced height
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 4.0), // Reduced height
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'View Report >',
                  style: TextStyle(fontSize: 14.0, color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
