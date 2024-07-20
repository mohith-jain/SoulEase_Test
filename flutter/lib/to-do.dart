import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Ensure the app is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set the preferred orientations and system UI overlay style
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF2EDE5),
      ),
      home: ToDoScreen(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF6D5B4B)),
          onPressed: () {
            Navigator.pop(context);// Handle the back button press
          },
        ),
        backgroundColor: Color(0xFFF2EDE5), // Same as the page background color
        elevation: 0, // Remove shadow
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0),
              Center(
                child: Text(
                  "TODAY'S GOALS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6D5B4B),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSection('HIGH PRIORITY', 4),
                        buildSection('TO-DO LIST', 4),
                        buildSection('SHOPPING', 4),
                        buildSection('APPOINTMENTS', 4),
                        buildSection('WORKOUT', 4),
                        buildChecklistSection(),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Date:',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        buildSection('NOTES', 4, height: 180),
                        buildWaterSection('WATER'),
                        buildSection('MEALS', 3, height: 140),
                        buildSection('REMEMBER', 5),
                        Container( // Doodle Here section
                          decoration: BoxDecoration(
                            color: Colors.white, // Changed to white color
                            border: Border.all(color: Color(0xFF6D5B4B)),
                          ),
                          height: 450,
                          child: Center(
                            child: Text(
                              'Doodle Here',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6D5B4B),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0), // Extra space to accommodate the fixed bottom navigation bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget buildSection(String title, int itemCount, {double height = 150}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6D5B4B),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Color(0xFFF6D89E),
            border: Border.all(color: Color(0xFF6D5B4B)),
          ),
          child: CustomPaint(
            painter: NotebookPainter(itemCount: itemCount),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    style: TextStyle(height: 1.0),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget buildWaterSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6D5B4B),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFFF6D89E),
            border: Border.all(color: Color(0xFF6D5B4B)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) => _buildWaterCircle()),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildWaterCircle() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.brown, // Changed water circle color to brown
      ),
    );
  }

  Widget buildChecklistSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CHECKLIST',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6D5B4B),
          ),
        ),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6D89E),
            border: Border.all(color: Color(0xFF6D5B4B)),
          ),
          child: Column(
            children: [
              buildChecklistItem('GET UP EARLY'),
              buildChecklistItem('MAKE A BED'),
              buildChecklistItem('STAY HYDRATED'),
              buildChecklistItem('WORKOUT'),
              buildChecklistItem('THINK POSITIVE'),
              buildChecklistItem('BRAINSTORMING'),
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget buildChecklistItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.check_box_outline_blank),
          SizedBox(width: 8.0),
          Text(text),
        ],
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
      Navigator.pushNamed(context, '/chat'); // Navigate to ChatStarted screen
    } else if (index == 0) {
      Navigator.pushNamed(context, '/main'); // Navigate to ChatStarted screen
    }
    else if (index == 2) {
      Navigator.pushNamed(context, '/review'); // Navigate to ChatStarted screen
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

class NotebookPainter extends CustomPainter {
  final int itemCount;

  NotebookPainter({required this.itemCount});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0;

    double lineHeight = size.height / itemCount;
    for (int i = 0; i < itemCount; i++) {
      double y = (i + 1) * lineHeight;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
