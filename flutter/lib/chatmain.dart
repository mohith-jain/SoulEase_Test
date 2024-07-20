import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2EDE5),
      ),
      home: const HomeScreen(),
      routes: {
        '/chat': (context) => const ChatStarted(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EDE5),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const UserHeader(),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HowAreYouToday(),
                  SizedBox(height: 20),
                  HealthMetrics(),
                  SizedBox(height: 20),
                  QuizAssessment(),
                  SizedBox(height: 20),
                  GuidedTipsSection(), // Add GuidedTips widget here
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFA26C03).withOpacity(0.33),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/david.jpg'),
                    ),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi! Welcome Alex', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            StyledChip(label: 'User'),
                            SizedBox(width: 20),
                            StyledChip(label: '😊Happy'),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications, color: Colors.black, size: 37),
                  ],
                ),
                SizedBox(height: 10),
                ThoughtOfTheDay(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StyledChip extends StatelessWidget {
  final String label;

  const StyledChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: const Color(0xFFC4912E).withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}

class ThoughtOfTheDay extends StatelessWidget {
  const ThoughtOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF6D89E),
            border: InputBorder.none,
            hintText: 'Enter your thought of the day...',
            hintStyle: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

class HowAreYouToday extends StatelessWidget {
  const HowAreYouToday({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('How Are You Today ?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EmojiButton(emoji: '😄', size: 50),
              EmojiButton(emoji: '😟', size: 50),
              EmojiButton(emoji: '😊', size: 50),
              EmojiButton(emoji: '😔', size: 50),
              EmojiButton(emoji: '😲', size: 50),
              EmojiButton(emoji: '😢', size: 50),
              EmojiButton(emoji: '😠', size: 50),
              EmojiButton(emoji: '😴', size: 50),
              EmojiButton(emoji: '😋', size: 50),
              EmojiButton(emoji: '😎', size: 50),
              EmojiButton(emoji: '😷', size: 50),
            ],
          ),
        ),
      ],
    );
  }
}

class EmojiButton extends StatelessWidget {
  final String emoji;
  final double size;

  const EmojiButton({super.key, required this.emoji, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        emoji,
        style: TextStyle(fontSize: size),
      ),
    );
  }
}

class HealthMetrics extends StatelessWidget {
  const HealthMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Health Metrics', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 10), // Add initial spacing
              MetricCard(
                title: 'Soul Score',
                value: '60%',
                color: Color(0xFFA26C03),
                baseColor: Color(0xFFF6D89E),
                progressColor: Colors.brown,
                icon: Icons.favorite,
              ),
              SizedBox(width: 10), // Adjust spacing between cards
              MetricCard(
                title: '😊 Mood',
                value: '50%',
                color: Color(0xFFA26C03),
                baseColor: Color(0xFFF6D89E),
                progressColor: Colors.brown,
              ),
              SizedBox(width: 10), // Adjust spacing between cards
              MetricCard(
                title: 'Targets',
                value: '70%',
                color: Color(0xFFA26C03),
                baseColor: Color(0xFFF6D89E),
                progressColor: Colors.brown,
              ),
              SizedBox(width: 10), // Adjust spacing between cards
              SampleGraph(
                title: 'App Usage',
                value: '40%',
                color: Color(0xFFA26C03),
                barValues: [0.2, 0.4, 0.6, 0.8, 1.0], // Example bar values
              ),
              SizedBox(width: 10), // Add final spacing
            ],
          ),
        ),
      ],
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color? baseColor;
  final Color? progressColor;
  final IconData? icon;
  final Widget? child;

  const MetricCard({super.key, 
    required this.title,
    required this.value,
    required this.color,
    this.baseColor,
    this.progressColor,
    this.icon,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (child == null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.red,
                    size: 24,
                  ),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          const SizedBox(height: 10),
          if (child != null) child!,
          if (child == null)
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 10.0,
              percent: double.parse(value.replaceAll('%', '')) / 100.0,
              center: Text(
                value,
                style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: baseColor ?? Colors.white,
              progressColor: progressColor ?? Colors.blue,
            ),
        ],
      ),
    );
  }
}

class SampleGraph extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final List<double> barValues;

  const SampleGraph({super.key, 
    required this.title,
    required this.value,
    required this.color,
    required this.barValues,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100.0, // Adjust the height as needed
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: barValues.map((value) {
                return Container(
                  width: 20.0,
                  height: value * 100, // Scale the bar height
                  color: Colors.white,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizAssessment extends StatelessWidget {
  const QuizAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Quiz Assessment', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 10), // Add initial spacing
              InfoCard(
                title: 'Well Being',
                color: Color(0xFF9EBEF6),
                cards: [
                  TestCard(
                    testName: 'PHQ-9',
                    icon: Icons.favorite,
                    color: Color(0xFF9EBEF6),
                  ),
                ],
              ),
              SizedBox(width: 10), // Adjust spacing between cards
              InfoCard(
                title: 'Mental Health',
                color: Color(0xFF9EBEF6),
                cards: [
                  TestCard(
                    testName: 'GAD-7',
                    icon: Icons.favorite,
                    color: Color(0xFF9EBEF6),
                  ),
                ],
              ),
              SizedBox(width: 10), // Add final spacing
            ],
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final Color color;
  final List<TestCard> cards;

  const InfoCard({super.key, required this.title, required this.color, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cards,
          ),
        ],
      ),
    );
  }
}

class TestCard extends StatelessWidget {
  final String testName;
  final IconData icon;
  final Color color;

  const TestCard({super.key, required this.testName, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.red),
        title: Text(testName),
        trailing: const Icon(Icons.arrow_forward),
        tileColor: color,
        onTap: () {},
      ),
    );
  }
}

class GuidedTipsSection extends StatelessWidget {
  const GuidedTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Guided Tips', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 10), // Add initial spacing
              MetricCard(
                title: 'Well-Being Tips',
                value: '60%',
                color: Color(0xFFA26C03),
                baseColor: Color(0xFFF6D89E),
                progressColor: Colors.brown,
                icon: Icons.favorite,
              ),
              SizedBox(width: 10), // Adjust spacing between cards
              MetricCard(
                title: 'Mental Health Tips',
                value: '50%',
                color: Color(0xFFA26C03),
                baseColor: Color(0xFFF6D89E),
                progressColor: Colors.brown,
              ),
              SizedBox(width: 10), // Adjust spacing between cards
              MetricCard(
                title: 'Physical Health Tips',
                value: '70%',
                color: Color(0xFFA26C03),
                baseColor: Color(0xFFF6D89E),
                progressColor: Colors.brown,
              ),
              SizedBox(width: 10), // Add final spacing
            ],
          ),
        ),
      ],
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

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

class ChatStarted extends StatelessWidget {
  const ChatStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: const Center(
        child: Text('Chat Screen Content'), // Replace with your chat screen content
      ),
    );
  }
}
