import 'package:flutter/material.dart';
import 'login.dart'; // Adjust this import path as per your project structure
import 'signup.dart'; // Adjust this import path as per your project structure
import 'changepass.dart'; // Adjust this import path as per your project structure
import 'otpverific.dart'; // Adjust this import path as per your project structure
import 'accselect.dart'; // Adjust this import path as per your project structure
import 'congra.dart'; // Adjust this import path as per your project structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Color(0xFFFDDEC4), // Updated background color
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/login', // Initial route set to '/login'
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/changepass': (context) => ChangePasswordPage(),
        '/otpverific': (context) => OTPVerificationScreen(),
        '/accselect': (context) => AccountSelectionScreen(), // Updated route name for accselect.dart
        '/congra': (context) => CongratulationsPage(), // Added route for congra.dart

          // Add other routes as needed
      },
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
