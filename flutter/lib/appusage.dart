import 'package:flutter/material.dart';
import 'package:soul_mad/chat1.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chatstarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AppUsage(),
        '/chat': (context) => const ChatStarted(),
        '/main': (context) => const MainScreen(),
        '/review': (context) => const ReviewScreen(),
      },
    );
  }
}

class AppUsage extends StatelessWidget {
  const AppUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to previous screen
                  },
                ),
                const SizedBox(width: 40),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Usage',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: 0),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Check your activity on app',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 30),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.brown,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.brown,
                    tabs: [
                      Tab(text: 'Last 24 hours'),
                      Tab(text: 'Last 10 days'),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: TabBarView(
                      children: [
                        SfCartesianChart(
                          primaryXAxis: const CategoryAxis(),
                          primaryYAxis: const NumericAxis(
                            minimum: 0,
                            maximum: 60,
                            interval: 10,
                          ),
                          series: <CartesianSeries>[
                            ColumnSeries<ChartData, String>(
                              dataSource: getChartData(),
                              xValueMapper: (ChartData data, _) => data.time,
                              yValueMapper: (ChartData data, _) => data.usage,
                              color: Colors.brown,
                            )
                          ],
                        ),
                        SfCartesianChart(
                          primaryXAxis: const CategoryAxis(),
                          primaryYAxis: const NumericAxis(
                            minimum: 0,
                            maximum: 60,
                            interval: 10,
                          ),
                          series: <CartesianSeries>[
                            ColumnSeries<ChartData, String>(
                              dataSource: getChartData(),
                              xValueMapper: (ChartData data, _) => data.time,
                              yValueMapper: (ChartData data, _) => data.usage,
                              color: Colors.brown,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Screen ON',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      '6h 2m',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Screen Off',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      '6h 2m',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('12A', 10),
      ChartData('2A', 30),
      ChartData('4A', 20),
      ChartData('6A', 40),
      ChartData('8A', 10),
      ChartData('10A', 50),
      ChartData('12P', 30),
      ChartData('2P', 40),
      ChartData('4P', 20),
      ChartData('6P', 50),
      ChartData('8P', 30),
      ChartData('10P', 60),
    ];
  }
}

class ChartData {
  ChartData(this.time, this.usage);
  final String time;
  final double usage;
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, '/chat'); // Navigate to ChatStarted screen
    } else if (index == 0) {
      Navigator.pushNamed(context, '/main'); // Navigate to Main screen
    } else if (index == 2) {
      Navigator.pushNamed(context, '/review'); // Navigate to Review screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTap,
      backgroundColor: const Color(0xFF9EBEF6),
      items: const [
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

// Placeholder widgets for the routes
class ChatStarted extends StatelessWidget {
  const ChatStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ChatStarted Screen'),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main Screen'),
      ),
    );
  }
}

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Review Screen'),
      ),
    );
  }
}
