import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SelectLanguagePage(),
  ));
}

class SelectLanguagePage extends StatelessWidget {
  const SelectLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    // Add clear search functionality
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('English (Australia)'),
                  subtitle: Text('English (Australia)'),
                ),
                ListTile(
                  title: Text('English (Canada)'),
                  subtitle: Text('English (Canada)'),
                ),
                ListTile(
                  title: Text('English (India)'),
                  subtitle: Text('English (India)'),
                ),
                ListTile(
                  title: Text('English (Ireland)'),
                  subtitle: Text('English (Ireland)'),
                ),
                ListTile(
                  title: Text('English (New Zealand)'),
                  subtitle: Text('English (New Zealand)'),
                ),
                ListTile(
                  title: Text('English (Singapore)'),
                  subtitle: Text('English (Singapore)'),
                ),
                ListTile(
                  title: Text('English (South Africa)'),
                  subtitle: Text('English (South Africa)'),
                ),
                ListTile(
                  title: Text('English (US)'),
                  subtitle: Text('English (US)'),
                ),
                ListTile(
                  title: Text('Deutsch'),
                  subtitle: Text('German'),
                ),
                ListTile(
                  title: Text('Italiano'),
                  subtitle: Text('Italian'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}
