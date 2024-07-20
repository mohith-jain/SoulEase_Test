import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:soul_mad/jwt_token_controller.dart'; // Import the JwtTokenController
import 'package:soul_mad/chat1.dart';
import 'login.dart';
import 'mood.dart';
import 'target.dart';
import 'appusage.dart';
import 'article1_bom.dart';
import 'article2_joy.dart';
import 'to-do.dart';
import 'anxiety_quiz.dart';
import 'depression.dart';
import 'stress.dart';
import 'eating.dart';
import 'communication.dart';
import 'sleep.dart';
import 'profile.dart';
import 'achievement.dart';
import 'report.dart';
import 'notify.dart';
import 'changepass.dart';
import 'otpverific.dart';
import 'accselect.dart';
import 'congra.dart';
import 'lang.dart';
import 'review.dart';
import 'signup.dart';
import 'dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await JwtTokenController.getToken();
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2EDE5),
      ),
      initialRoute: token != null && JwtTokenController.isTokenValid(token) ? '/dashboard' : '/login',
      routes: {
        '/changepass': (context) => ChangePasswordPage(),
        '/otpverific': (context) => const OTPVerificationScreen(),
        '/accselect': (context) => const AccountSelectionScreen(),
        '/congra': (context) => const CongratulationsPage(),
        '/login': (context) => LoginScreen(),
        '/main': (context) => const HomeScreen(),
        '/chat': (context) => ChatScreen(),
        '/mood': (context) => const MoodStatsScreen(),
        '/target': (context) => TargetScreen(),
        '/appusage': (context) => const AppUsage(),
        '/article1': (context) => Article1Screen(),
        '/article2': (context) => Article2Screen(),
        '/to-do': (context) => ToDoScreen(),
        '/anxiety_quiz': (context) => AnxietySurveyPage(),
        '/depression': (context) => DepressionSurveyPage(),
        '/stress': (context) => StressSurveyPage(),
        '/eating': (context) => EatingHabitsSurveyPage(),
        '/communication': (context) => CommunicationSurveyPage(),
        '/sleep': (context) => SleepHygineSurveyPage(),
        '/profile': (context) => UserProfilePage(),
        '/achievement': (context) => AchievementsPage(),
        '/report': (context) => MyReportPage(),
        '/notify': (context) => NotificationsPage(),
        '/lang': (context) => const SelectLanguagePage(),
        '/review': (context) => BlogsAndReviewsScreen(),
        '/dashboard': (context) => Dashboard(token: token!),
      },
      home: token != null && JwtTokenController.isTokenValid(token)
          ? Dashboard(token: token!)
          : SignupScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFA26C03).withOpacity(0.33),
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
            const SizedBox(height: 15),
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
                  GuidedTipsSection(),
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
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/david.jpg'),
                  ),
                  const SizedBox(width: 25),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi! Welcome Alex',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          StyledChip(label: 'User'),
                          SizedBox(width: 20),
                          StyledChip(label: '😊Happy'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/notify');
                    },
                    child: const Icon(Icons.notifications, color: Colors.black, size: 37),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const ThoughtOfTheDay(),
          ],
        ),
      ),
    );
  }
}

class StyledChip extends StatelessWidget {
  final String label;

  const StyledChip({Key? key, required this.label}) : super(key: key);

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
  const ThoughtOfTheDay({Key? key}) : super(key: key);

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
  const HowAreYouToday({Key? key}) : super(key: key);

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
              EmojiButton(emoji: '😢', size: 50),
              EmojiButton(emoji: '😡', size: 50),
              EmojiButton(emoji: '😴', size: 50),
              EmojiButton(emoji: '😱', size: 50),
              EmojiButton(emoji: '😇', size: 50),
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

  const EmojiButton({Key? key, required this.emoji, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            emoji,
            style: TextStyle(fontSize: size),
          ),
        ),
      ),
    );
  }
}

class HealthMetrics extends StatelessWidget {
  const HealthMetrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Health Metrics', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const HealthMetricCard(
              title: 'Exercise',
              value: '30 min',
              color: Colors.green,
            ),
            const HealthMetricCard(
              title: 'Water Intake',
              value: '2 L',
              color: Colors.blue,
            ),
            const HealthMetricCard(
              title: 'Sleep',
              value: '8 hr',
              color: Colors.purple,
            ),
          ],
        ),
      ],
    );
  }
}

class HealthMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const HealthMetricCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(value, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class QuizAssessment extends StatelessWidget {
  const QuizAssessment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Quiz Assessment', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        QuizCard(
          title: 'Anxiety Quiz',
          color: Colors.orange,
          route: '/anxiety_quiz',
        ),
        QuizCard(
          title: 'Depression Quiz',
          color: Colors.red,
          route: '/depression',
        ),
        QuizCard(
          title: 'Stress Quiz',
          color: Colors.blue,
          route: '/stress',
        ),
        QuizCard(
          title: 'Eating Habits Quiz',
          color: Colors.green,
          route: '/eating',
        ),
        QuizCard(
          title: 'Communication Quiz',
          color: Colors.purple,
          route: '/communication',
        ),
        QuizCard(
          title: 'Sleep Hygiene Quiz',
          color: Colors.teal,
          route: '/sleep',
        ),
      ],
    );
  }
}

class QuizCard extends StatelessWidget {
  final String title;
  final Color color;
  final String route;

  const QuizCard({
    Key? key,
    required this.title,
    required this.color,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: color.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_forward, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

class GuidedTipsSection extends StatelessWidget {
  const GuidedTipsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Guided Tips', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        GuidedTipCard(
          title: 'Mindfulness Meditation',
          description: 'Learn the basics of mindfulness meditation.',
          color: Colors.lightBlue,
        ),
        GuidedTipCard(
          title: 'Breathing Exercises',
          description: 'Practice deep breathing exercises.',
          color: Colors.lightGreen,
        ),
        GuidedTipCard(
          title: 'Healthy Eating',
          description: 'Tips for a balanced and healthy diet.',
          color: Colors.orangeAccent,
        ),
        GuidedTipCard(
          title: 'Sleep Hygiene',
          description: 'Improve your sleep with these tips.',
          color: Colors.purpleAccent,
        ),
        GuidedTipCard(
          title: 'Physical Activity',
          description: 'Stay active with these exercises.',
          color: Colors.pinkAccent,
        ),
      ],
    );
  }
}

class GuidedTipCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const GuidedTipCard({
    Key? key,
    required this.title,
    required this.description,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/main');
            break;
          case 1:
            Navigator.pushNamed(context, '/profile');
            break;
          case 2:
            Navigator.pushNamed(context, '/settings');
            break;
        }
      },
    );
  }}