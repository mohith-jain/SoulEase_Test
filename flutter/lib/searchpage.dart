import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<User> users;

  const SearchPage({super.key, required this.users});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<User> searchResults; // List to store search results
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchResults = List.from(widget.users); // Initialize searchResults with passed users list
  }

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
                  subtitle: Text(user.level ?? ''), // Ensure level is not null
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
      filteredUsers = List.from(widget.users); // Display all users if query is empty
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

class User {
  final String name;
  String? level; // Ensure this is nullable if some users don't have a level
  final String? imageUrl;
  bool? isAvailable; // For Professional

  User(this.name, this.level, {this.imageUrl, this.isAvailable});
}
