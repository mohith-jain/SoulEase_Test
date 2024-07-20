import 'package:flutter/material.dart';

class RayanChatPage extends StatefulWidget {
  const RayanChatPage({super.key});

  @override
  _RayanChatPageState createState() => _RayanChatPageState();
}

class _RayanChatPageState extends State<RayanChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  void initState() {
    super.initState();
    // Simulating a conversation with sample messages
    _messages.addAll([
      const ChatMessage(
        text: 'Hi there!',
        isUser: false,
      ),
      const ChatMessage(
        text: 'Hello! How are you?',
        isUser: true,
      ),
      const ChatMessage(
        text: 'I\'m good, thanks! How about you?',
        isUser: false,
      ),
      const ChatMessage(
        text: 'I\'m doing great!',
        isUser: true,
      ),
      const ChatMessage(
        text: 'That\'s good to hear.',
        isUser: false,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 90,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(Icons.arrow_back, size: 24),
              const SizedBox(width: 8), // Adjust the width to your preference
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.brown[200],
                child: const Icon(Icons.person, size: 30, color: Colors.black),
              ),
            ],
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10), // Adjusted spacing
            Text(
              'Dr. Rayan', // Replace with dynamic user name
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                'Online', // Replace with dynamic status
                style: TextStyle(fontSize: 14, color: Colors.lightBlue),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle popup menu actions
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'View contact',
                child: Text('View contact'),
              ),
              const PopupMenuItem<String>(
                value: 'Media, links, and docs',
                child: Text('Media, links, and docs'),
              ),
              const PopupMenuItem<String>(
                value: 'Search',
                child: Text('Search'),
              ),
              const PopupMenuItem<String>(
                value: 'Mute notifications',
                child: Text('Mute notifications'),
              ),
              const PopupMenuItem<String>(
                value: 'Wallpaper',
                child: Text('Wallpaper'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Divider(height: 20.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 2.0, bottom: 80.0),
              itemCount: _messages.length,
              controller: _scrollController,
              reverse: false,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.add(message);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class JennieChatPage extends StatefulWidget {
  const JennieChatPage({super.key});

  @override
  _JennieChatPageState createState() => _JennieChatPageState();
}

class _JennieChatPageState extends State<JennieChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  void initState() {
    super.initState();
    // Simulating a conversation with sample messages
    _messages.addAll([
      const ChatMessage(
        text: 'Hey Jennie!',
        isUser: false,
      ),
      const ChatMessage(
        text: 'Hi! How are you?',
        isUser: true,
      ),
      const ChatMessage(
        text: 'I\'m good, thanks! How about you?',
        isUser: false,
      ),
      const ChatMessage(
        text: 'I\'m doing great!',
        isUser: true,
      ),
      const ChatMessage(
        text: 'Glad to hear that!',
        isUser: false,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 90,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(Icons.arrow_back, size: 24),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.brown[200],
                child: const Icon(Icons.person, size: 30, color: Colors.black),
              ),
            ],
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Dr. Jennie', // Replace with dynamic user name
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                'Online', // Replace with dynamic status
                style: TextStyle(fontSize: 14, color: Colors.lightBlue),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle popup menu actions
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'View contact',
                child: Text('View contact'),
              ),
              const PopupMenuItem<String>(
                value: 'Media, links, and docs',
                child: Text('Media, links, and docs'),
              ),
              const PopupMenuItem<String>(
                value: 'Search',
                child: Text('Search'),
              ),
              const PopupMenuItem<String>(
                value: 'Mute notifications',
                child: Text('Mute notifications'),
              ),
              const PopupMenuItem<String>(
                value: 'Wallpaper',
                child: Text('Wallpaper'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Divider(height: 20.0),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 2.0, bottom: 80.0),
              itemCount: _messages.length,
              controller: _scrollController,
              reverse: false,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.add(message);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isUser)
            const CircleAvatar(
              child: Text('R'), // Replace with dynamic initials or image
            ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue[200] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          if (isUser)
            const CircleAvatar(
              child: Text('U'), // Replace with dynamic initials or image
            ),
        ],
      ),
    );
  }
}
