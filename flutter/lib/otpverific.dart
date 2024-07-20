// otpverific.dart

import 'package:flutter/material.dart';
// Ensure this import points to your actual LoginScreen location
import 'verification.dart'; // Assuming this is your verification screen location

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GlobalKey for accessing the form state
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    // Controllers for text field inputs
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    // Regular expressions for validation
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');

    // Validation functions
    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email address is required';
      } else if (!emailRegex.hasMatch(value)) {
        return 'Enter valid email id (@gmail.com)';
      }
      return null;
    }

    String? validatePhone(String? value) {
      if (value == null || value.isEmpty) {
        return 'Phone number is required';
      } else if (!phoneRegex.hasMatch(value)) {
        return 'Enter valid phone number';
      }
      return null;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFDDEC4), // Set the background color
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey, // Assign the GlobalKey to the Form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.verified_user,
                  size: 80,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  'Enter email and phone number to\nsend one time password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              const SizedBox(height: 10), // Add vertical padding to the divider
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: validateEmail,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: validatePhone,
              ),
              const SizedBox(height: 30), // Increased padding to move the button down
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0), // Add bottom padding to the button
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate inputs before sending OTP
                      if (_formKey.currentState!.validate()) {
                        // Navigate to VerificationScreen on successful validation
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // Set the button color
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ), // Set the text color to white
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0), // Add bottom padding from the bottom edge
                child: const Center(
                  child: Text(
                    'Never share your OTP verification code with anyone.\nStay safe and secure!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
