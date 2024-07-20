import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SessionsScreen(),
    );
  }
}

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sessions'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SessionSection(
              title: 'UPCOMING SESSIONS',
              sessions: [
                SessionCard(
                  doctorName: 'Dr. Jack',
                  date: '16 Aug',
                  time: '3:00 PM to 3:50 PM',
                  imageUrl: 'assets/dr_jack.png',
                ),
                SessionCard(
                  doctorName: 'Dr. Suman',
                  date: '26 Aug',
                  time: '5:00 PM to 5:50 PM',
                  imageUrl: 'assets/dr_suman.png',
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
                  imageUrl: 'assets/dr_peter.png',
                ),
              ],
            ),
            SizedBox(height: 20),
            MyTherapistsSection(),
          ],
        ),
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

  const SessionCard({super.key, 
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
        TherapistButton(doctorName: 'Dr. Suman', imageUrl: 'assets/dr_suman.png'),
        TherapistButton(doctorName: 'Dr. Jack', imageUrl: 'assets/dr_jack.png'),
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
