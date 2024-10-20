import 'package:flutter/material.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/SignUp.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
              children: [
                // Icon/Logo at the top
                SizedBox(
                  height: 300,
                  child: Center(
                    child: Image.asset('assets/images/login.png'), // Placeholder for the logo
                  ),
                ),

                // Email Field
                _buildTextField(Icons.email, 'Valid email'),

                // Password Field
                _buildTextField(Icons.lock, 'Strong Password', obscureText: true, showEyeIcon: true),

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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Signup()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already a member? ',
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: 'Sign up',
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
  Widget _buildTextField(IconData icon, String hintText, {bool obscureText = false, bool showEyeIcon = false}) {
    bool isVisible = !obscureText; // Track visibility of password

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: obscureText && !isVisible,
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
          suffixIcon: showEyeIcon
              ? IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white70,
            ),
            onPressed: () {
              // Toggle password visibility
            },
          )
              : null,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
