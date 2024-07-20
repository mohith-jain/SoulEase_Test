import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatDiscoverPage(),
    );
  }
}

class ChatDiscoverPage extends StatefulWidget {
  const ChatDiscoverPage({super.key});

  @override
  _ChatDiscoverPageState createState() => _ChatDiscoverPageState();
}

class _ChatDiscoverPageState extends State<ChatDiscoverPage> {
  String selectedSection = 'Listener';
  List<User> usersListener = List.from(users);
  List<User> usersGuide = List.from(users);
  List<User> usersProfessional = List.from(users);

  List<User> displayedUsers = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    // Initialize displayedUsers based on the initial selected section
    updateDisplayedUsers();
  }

  void updateDisplayedUsers() {
    switch (selectedSection) {
      case 'Listener':
        setState(() {
          displayedUsers = List.from(usersListener)..shuffle();
        });
        break;
      case 'Guide':
        setState(() {
          displayedUsers = List.from(usersGuide)..shuffle();
        });
        break;
      case 'Professional':
        setState(() {
          displayedUsers = List.from(usersProfessional)
            ..shuffle()
            ..forEach((user) {
              // Set isAvailable property based on your condition
              user.isAvailable = Random().nextBool(); // Example condition
            });
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Discover',
          style: TextStyle(
            color: Colors.brown,
            fontSize: 26.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage(users: users)),
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            _buildTopSection(context),
            _buildContactsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTopSectionItem(
                context,
                'Listener',
                    () {
                  setState(() {
                    selectedSection = 'Listener';
                    updateDisplayedUsers();
                  });
                },
              ),
              const SizedBox(width: 25.0), // Increased space between items
              _buildTopSectionItem(
                context,
                'Guide',
                    () {
                  setState(() {
                    selectedSection = 'Guide';
                    updateDisplayedUsers();
                  });
                },
              ),
              const SizedBox(width: 25.0), // Increased space between items
              _buildTopSectionItem(
                context,
                'Professional',
                    () {
                  setState(() {
                    selectedSection = 'Professional';
                    updateDisplayedUsers();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16.0), // Increased space below row
          Container(
            height: 6.0,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFF6D89E),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSectionItem(
      BuildContext context, String title, VoidCallback onTap) {
    bool isSelected = selectedSection == title;
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.brown[800] : Colors.brown[600],
        ),
      ),
    );
  }

  Widget _buildContactsSection(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedUsers.length,
      itemBuilder: (context, index) {
        final user = displayedUsers[index];
        return ListTile(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: CircleAvatar(
            backgroundColor: Colors.orange, // Pink background color
            radius: 24.0, // Increase radius for larger circle
            child: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Text(
                      user.name[0].toUpperCase(), // Display first letter of name
                      style: const TextStyle(
                        color: Colors.white, // White text color
                        fontSize: 25.0, // Increased font size
                        fontWeight: FontWeight.bold, // Bold font weight
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (selectedSection == 'Listener' || selectedSection == 'Guide')
                Text(
                  user.level,
                  style: TextStyle(color: Colors.brown[400], fontSize: 20.0),
                ),
              if (selectedSection == 'Professional' && user.isAvailable == true)
                const Text(
                  'Available',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class User {
  final String name;
  String level; // For Guide and Listener
  final String? imageUrl;
  bool? isAvailable; // For Professional

  User(this.name, this.level, {this.imageUrl, this.isAvailable});
}

// Example list of users (you can replace it with your actual user list)
List<User> users = [
  User('Ashika', 'Level 2'),
  User('Boomika', 'Level 3'),
  User('Rahul', 'Level 2'),
  User('Raj', 'Level 3'),
  User('Ayush', 'Level 2'),
  User('Karthik', 'Level 3'),
  User('Mahajan', 'Level 2'),
  User('Ram', 'Level 3'),
  User('Manvi', 'Level 2'),
  User('Monica', 'Level 3'),
  User('Kritika', 'Level 2'),
  User('Lokesh', 'Level 3'),
  User('Ania', 'Level 2'),
  User('Brijesh', 'Level 3'),
  User('Amika', 'Level 2'),
  User('Rohit', 'Level 3'),
  User('Rajesh', 'Level 2'),
  User('Malivya', 'Level 3'),
  User('Akriti', 'Level 2'),
  User('Anu', 'Level 3'),
  User('Shreya', 'Level 2'),
  User('Suman', 'Level 3'),
];

class SearchPage extends StatefulWidget {
  final List<User> users;

  const SearchPage({super.key, required this.users});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<User> searchResults = []; // List to store search results
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                performSearch(value);
              },
              decoration: InputDecoration(
                labelText: 'Search users',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    performSearch(searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final user = searchResults[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.level),
                  // Add more details or actions if needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void performSearch(String query) {
    List<User> filteredUsers = []; // Temporary list to hold search results

    if (query.isEmpty) {
      filteredUsers = widget.users;
    } else {
      // Perform filtering based on your users list
      filteredUsers = widget.users.where((user) =>
          user.name.toLowerCase().contains(query.toLowerCase())).toList();
    }

    setState(() {
      searchResults = filteredUsers;
    });
  }
}
