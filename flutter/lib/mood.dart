import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MoodStatsScreen(),
    );
  }
}

class MoodStatsScreen extends StatefulWidget {
  const MoodStatsScreen({super.key});

  @override
  _MoodStatsScreenState createState() => _MoodStatsScreenState();
}

class _MoodStatsScreenState extends State<MoodStatsScreen> {
  // Define variables to hold different data sets for All, Days, Weeks, and Months
  final List<MoodData> _allData = [
    MoodData('Mon', 20),
    MoodData('Tue', 50),
    MoodData('Wed', 30),
    MoodData('Thu', 80),
    MoodData('Fri', 60),
    MoodData('Sat', 100),
    MoodData('Sun', 40),
  ];

  final List<MoodData> _daysData = [
    MoodData('Mon', 50),
    MoodData('Tue', 20),
    MoodData('Wed', 80),
    MoodData('Thu', 65),
    MoodData('Fri', 15),
    MoodData('Sat', 80),
    MoodData('Sun', 90),
  ];

  final List<MoodData> _weeksData = [
    MoodData('Week 1', 60),
    MoodData('Week 2', 30),
    MoodData('Week 3', 50),
    MoodData('Week 4', 70),
  ];

  final List<MoodData> _monthsData = [
    MoodData('Jan', 70),
    MoodData('Feb', 40),
    MoodData('Mar', 60),
    MoodData('Apr', 80),
    MoodData('May', 50),
    MoodData('Jun', 90),
  ];

  // Variable to track currently selected toggle button
  String _selectedButton = 'All';

  // Emotion progress percentages
  final List<int> _emotionProgress = [80, 30, 50, 25, 35, 65, 90, 55];

  // Method to switch data based on the selected button
  List<MoodData> _getSelectedData() {
    switch (_selectedButton) {
      case 'All':
        return _allData;
      case 'Days':
        return _daysData;
      case 'Weeks':
        return _weeksData;
      case 'Months':
        return _monthsData;
      default:
        return _allData; // Default to all data
    }
  }

  // Update method to shuffle progress bar values for Days, Weeks, and Months
  void _updateDataForToggleButton(String button) {
    setState(() {
      _selectedButton = button;
      if (_selectedButton == 'Days') {
        _daysData.shuffle();
        _emotionProgress.shuffle();
      } else if (_selectedButton == 'Weeks') {
        _weeksData.shuffle();
        _emotionProgress.shuffle();
      } else if (_selectedButton == 'Months') {
        _monthsData.shuffle();
        _emotionProgress.shuffle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EFE3), // Overall background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6D4C41)),
          onPressed: () {
            Navigator.pop(context); // Navigate back when back button is pressed
          },
        ),
        title: Text(
          'Mood Stats $_selectedButton',
          style: const TextStyle(color: Color(0xFF6D4C41), fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mood Stats',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6D4C41),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Check your mood throughout the day',
              style: TextStyle(color: Color(0xFF6D4C41), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ToggleButton(
                  text: 'All',
                  isSelected: _selectedButton == 'All',
                  onPressed: () {
                    _updateDataForToggleButton('All');
                  },
                ),
                ToggleButton(
                  text: 'Days',
                  isSelected: _selectedButton == 'Days',
                  onPressed: () {
                    _updateDataForToggleButton('Days');
                  },
                ),
                ToggleButton(
                  text: 'Weeks',
                  isSelected: _selectedButton == 'Weeks',
                  onPressed: () {
                    _updateDataForToggleButton('Weeks');
                  },
                ),
                ToggleButton(
                  text: 'Months',
                  isSelected: _selectedButton == 'Months',
                  onPressed: () {
                    _updateDataForToggleButton('Months');
                  },
                ),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xFFF8EFE3), // Card background color
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SfCartesianChart(
                    plotAreaBackgroundColor: const Color(0xFFF8EFE3), // Background color behind the graph
                    primaryXAxis: const CategoryAxis(),
                    series: <CartesianSeries>[
                      AreaSeries<MoodData, String>(
                        dataSource: _getSelectedData(),
                        xValueMapper: (MoodData data, _) => data.day,
                        yValueMapper: (MoodData data, _) => data.moodLevel,
                        color: const Color.fromRGBO(110, 75, 63, 0.3), // Light brown color with opacity
                      ),
                      LineSeries<MoodData, String>(
                        dataSource: _getSelectedData(),
                        xValueMapper: (MoodData data, _) => data.day,
                        yValueMapper: (MoodData data, _) => data.moodLevel,
                        color: _selectedButton == 'Days' ? Colors.brown : const Color(0xFF6D4C41), // Different color for Days
                        width: 3, // Make the graph line bold
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            const Text(
              'Your Emotions',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6D4C41),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        EmotionBar(emoji: '😊', percentage: _emotionProgress[0]),
                        EmotionBar(emoji: '😢', percentage: _emotionProgress[1]),
                        EmotionBar(emoji: '😡', percentage: _emotionProgress[2]),
                        EmotionBar(emoji: '😱', percentage: _emotionProgress[3]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 26),
                  Expanded(
                    child: Column(
                      children: [
                        EmotionBar(emoji: '😤', percentage: _emotionProgress[4]),
                        EmotionBar(emoji: '😓', percentage: _emotionProgress[5]),
                        EmotionBar(emoji: '😆', percentage: _emotionProgress[6]),
                        EmotionBar(emoji: '😞', percentage: _emotionProgress[7]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const ToggleButton({super.key, required this.text, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: isSelected ? WidgetStateProperty.all<Color>(const Color(0xFF6D4C41)) : null,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFF6D4C41)),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF6D4C41),
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}

class EmotionBar extends StatelessWidget {
  final String emoji;
  final int percentage;

  const EmotionBar({super.key, required this.emoji, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Stack(
            children: [
              Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6D89E),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 150 * (percentage / 100),
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF542A19),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$percentage%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoodData {
  final String day;
  final int moodLevel;

  MoodData(this.day, this.moodLevel);
}

