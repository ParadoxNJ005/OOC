import 'package:flutter/material.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/LogIn.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF5F52), // Light red at the top
                Color(0xFF000000), // Black at the bottom
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon/Logo at the top
                SizedBox(
                  height: 300,
                  child: Center(
                    child: Image.asset('assets/images/sign_up.png'), // Placeholder for the logo
                  ),
                ),

                // Full Name Field
                _buildTextField(Icons.person, 'Full name'),

                // Email Field
                _buildTextField(Icons.email, 'Valid email'),

                // Phone Number Field
                _buildTextField(Icons.phone, 'Phone number'),

                // Password Field
                _buildTextField(Icons.lock, 'Strong Password', obscureText: true),

                SizedBox(height: 10),

                // Terms and Conditions Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: false, // Manage this with state
                      onChanged: (bool? value) {
                        // Handle checkbox state
                      },
                      activeColor: Color(0xFFFF4757), // Checkbox color
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'By checking the box you agree to our ',
                          style: TextStyle(color: Colors.white70),
                          children: [
                            TextSpan(
                              text: 'Terms and Conditions.',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Next Button
                ElevatedButton(
                  onPressed: () {
                    // Handle navigation to the next screen
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    backgroundColor: Color(0xFFFF4757), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5, // Add shadow
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),

                // Already a member? Log in
                GestureDetector(
                  onTap: () {
                    // Navigate to Login page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already a member? ',
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build TextField widgets
  Widget _buildTextField(IconData icon, String hintText, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white12, // Field background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15), // Add padding inside TextField
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
