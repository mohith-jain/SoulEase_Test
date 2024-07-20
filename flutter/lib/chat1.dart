import 'package:flutter/material.dart';
import 'rayanchat.dart'; // Import the rayanchat.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Chat UI',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Text('Chat', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.brown,
          labelColor: Colors.brown,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(icon: Icon(Icons.chat), text: 'Chat'),
            Tab(icon: Icon(Icons.group), text: 'Community'),
            Tab(icon: Icon(Icons.event), text: 'Sessions'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChatTab(),
          _buildCommunityTab(),
          _buildSessionsTab(),
        ],
      ),
    );
  }

  Widget _buildChatTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search or start new chat...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Online Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text('More', style: TextStyle(color: Colors.blue, fontSize: 16)),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16),
              _buildOnlineUser('assets/images/priya.jpg', 'Priya'),
              _buildOnlineUser('assets/images/jack.jpg', 'Jack'),
              _buildOnlineUser('assets/images/jennie.jpg', 'Jennie'),
              _buildOnlineUser('assets/images/david.jpg', 'David'),
              _buildOnlineUser('assets/images/Rayan.jpg', 'Rayan'),
              const SizedBox(width: 16),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView(
            children: [
              _buildMessageItem(context, 'assets/images/Rayan.jpg', 'Dr. Rayan', 'Hi! Good morning', '13:19 PM', true),
              _buildMessageItem(context, 'assets/images/jennie.jpg', 'Dr. Jennie', 'How are you?', '13:19 PM', false),
              _buildMessageItem(context, 'assets/images/priya.jpg', 'Dr. Priya', 'How are you?', '13:19 PM', true),
              _buildMessageItem(context, 'assets/images/david.jpg', 'David', 'You have such a good hobby', '13:19 PM', true),
              _buildMessageItem(context, 'assets/images/Rayan.jpg', 'Peter', 'I am here for you', '13:19 PM', false),
              _buildMessageItem(context, 'assets/images/jack.jpg', 'Jack', 'I am here for you', '13:19 PM', true),
              _buildMessageItem(context, 'assets/images/david.jpg', 'Sorabh', 'Hi! Good morning', '13:19 PM', true),
              _buildMessageItem(context, 'assets/images/jennie.jpg', 'Nancy', 'How are you?', '13:19 PM', false),
              _buildMessageItem(context, 'assets/images/priya.jpg', 'Riya', 'How are you?', '13:19 PM', true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOnlineUser(String imagePath, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context, String imagePath, String name, String message, String time, bool isRead) {
    return GestureDetector(
      onTap: () {
        if (name == 'Dr. Rayan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RayanChatPage()),
          );
        } else if (name == 'Dr. Jennie') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JennieChatPage()),
          );
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        message,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    isRead ? const Icon(Icons.done_all, color: Colors.blue, size: 20) : const Icon(Icons.done, color: Colors.grey, size: 20),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 3, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildCommunityTab() {
    return ListView(
      children: _buildCommunityChats(),
    );
  }

  List<Widget> _buildCommunityChats() {
    return [
      _buildCommunityChatItem('Community User 1', 'Hello!', '10:00 AM'),
      _buildCommunityChatItem('Community User 2', 'Hi there!', '10:30 AM'),
      _buildCommunityChatItem('Community User 3', 'How are you?', '11:00 AM'),
      _buildCommunityChatItem('Community User 4', 'Nice weather today.', '12:00 PM'),
      _buildCommunityChatItem('Community User 5', 'See you later!', '1:00 PM'),
      _buildCommunityChatItem('Community User 6', 'Have a great day!', '2:00 PM'),
      _buildCommunityChatItem('Community User 7', 'Good night!', '3:00 PM'),
      _buildCommunityChatItem('Community User 8', 'What\'s up?', '4:00 PM'),
    ];
  }

  Widget _buildCommunityChatItem(String name, String message, String time) {
    return GestureDetector(
      onTap: () {
        // Handle tapping on community chat item
      },
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/comm.jpg'),
            ),
            title: Text(name),
            subtitle: Text(message),
            trailing: Text(time),
          ),
          const Divider(height: 2, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildSessionsTab() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          SessionSection(
            title: 'UPCOMING SESSIONS',
            sessions: [
              SessionCard(
                doctorName: 'Dr. Jack',
                date: '16 Aug',
                time: '3:00 PM to 3:50 PM',
                imageUrl: 'assets/images/jack.jpg',
              ),
              SessionCard(
                doctorName: 'Dr. Suman',
                date: '26 Aug',
                time: '5:00 PM to 5:50 PM',
                imageUrl: 'assets/images/suman.jpg',
              ),
            ],
          ),
          SizedBox(height: 20),
          SessionSection(
            title: 'LAST SESSION',
            sessions: [
              SessionCard(
                doctorName: 'Dr. Peter',
                speciality: 'Psychiatrist',
                lastSessionInfo: 'Last session was 2 days ago',
                imageUrl: 'assets/images/Rayan.jpg',
              ),
            ],
          ),
          SizedBox(height: 20),
          MyTherapistsSection(),
        ],
      ),
    );
  }
}

class SessionSection extends StatelessWidget {
  final String title;
  final List<Widget> sessions;

  const SessionSection({super.key, required this.title, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: sessions,
        ),
      ],
    );
  }
}

class SessionCard extends StatelessWidget {
  final String doctorName;
  final String? date;
  final String? time;
  final String? speciality;
  final String? lastSessionInfo;
  final String imageUrl;

  const SessionCard({
    super.key,
    required this.doctorName,
    this.date,
    this.time,
    this.speciality,
    this.lastSessionInfo,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(doctorName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (date != null && time != null) ...[
              Text('$date - $time'),
            ],
            if (speciality != null) ...[
              Text(speciality!),
              Text(lastSessionInfo ?? ''),
            ],
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }
}

class MyTherapistsSection extends StatelessWidget {
  const MyTherapistsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Therapist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        TherapistButton(doctorName: 'Dr. Suman', imageUrl: 'assets/images/suman.jpg'),
        TherapistButton(doctorName: 'Dr. Jack', imageUrl: 'assets/images/jack.jpg'),
      ],
    );
  }
}

class TherapistButton extends StatelessWidget {
  final String doctorName;
  final String imageUrl;

  const TherapistButton({super.key, required this.doctorName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(doctorName),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('BOOK'),
        ),
      ),
    );
  }
}
