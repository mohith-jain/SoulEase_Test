import 'dart:async';
import 'package:flutter/material.dart';

class AccountSelectionScreen extends StatefulWidget {
  const AccountSelectionScreen({Key? key}) : super(key: key);

  @override
  _AccountSelectionScreenState createState() => _AccountSelectionScreenState();
}

class _AccountSelectionScreenState extends State<AccountSelectionScreen> {
  String selectedAccountType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDDEC4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Select your account type',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: const Text(
                'Choose one',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  AccountTypeCard(
                    icon: Icons.person,
                    label: 'User',
                    iconSize: 70,
                    onSelect: () {
                      setState(() {
                        selectedAccountType = 'User';
                      });
                      if (selectedAccountType == 'User') {
                        Timer(Duration(seconds: 1), () {
                          Navigator.pushNamed(context, '/congra');
                        });
                      }
                    },
                  ),
                  AccountTypeCard(
                    icon: Icons.hearing,
                    label: 'Listener',
                    iconSize: 70,
                    onSelect: () {
                      setState(() {
                        selectedAccountType = 'Listener';
                      });
                    },
                  ),
                  AccountTypeCard(
                    icon: Icons.star,
                    label: 'Experienced',
                    iconSize: 70,
                    onSelect: () {
                      setState(() {
                        selectedAccountType = 'Experienced';
                      });
                    },
                  ),
                  AccountTypeCard(
                    icon: Icons.verified_user,
                    label: 'Professional',
                    iconSize: 70,
                    onSelect: () {
                      setState(() {
                        selectedAccountType = 'Professional';
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            selectedAccountType.isNotEmpty
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'You have chosen to be a $selectedAccountType.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            )
                : Container(),
            const SizedBox(height: 30),
            const Text(
              'You are a few steps away from a seamless interaction.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class AccountTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconSize;
  final VoidCallback onSelect;

  const AccountTypeCard({
    Key? key,
    required this.icon,
    required this.label,
    this.iconSize = 50,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFDF4EF),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
