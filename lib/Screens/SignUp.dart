import 'package:flutter/material.dart';
import 'package:pulse/BottomNav/BottomNav.dart';
import 'package:pulse/Database/Auth.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/LogIn.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false; // Checkbox state for Terms and Conditions
  bool _isLoading = false; // Loading state

  // Controllers for TextFormFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final auth = AUTH();

  // Method to show a loading dialog
  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents the dialog from being dismissed
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }

  // Method to hide the loading dialog
  void _hideLoadingDialog() {
    Navigator.of(context).pop(); // Closes the dialog
  }

  void signup() async {
    if (_formKey.currentState!.validate() && _termsAccepted) {
      setState(() {
        _isLoading = true; // Start loading
      });
      _showLoadingDialog(); // Show the loading spinner

      final status = await auth.signUp(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _phoneController.text,
      );

      _hideLoadingDialog(); // Hide the loading spinner
      setState(() {
        _isLoading = false; // Stop loading
      });

      if (status == "Success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
        );
      } else {
        // Show error message if signup fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup failed: $status'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } else if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the terms and conditions'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
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
            child: Form(
              key: _formKey, // Form key to manage validation
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
                  _buildTextField(
                    controller: _nameController,
                    icon: Icons.person,
                    hintText: 'Full name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),

                  // Email Field
                  _buildTextField(
                    controller: _emailController,
                    icon: Icons.email,
                    hintText: 'Valid email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Simple email validation
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  // Phone Number Field
                  _buildTextField(
                    controller: _phoneController,
                    icon: Icons.phone,
                    hintText: 'Phone number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // Simple phone number validation
                      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),

                  // Password Field
                  _buildTextField(
                    controller: _passwordController,
                    icon: Icons.lock,
                    hintText: 'Strong Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  // Terms and Conditions Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: _termsAccepted,
                        onChanged: (bool? value) {
                          setState(() {
                            _termsAccepted = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFFFF4757), // Checkbox color
                      ),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
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

                  const SizedBox(height: 20),

                  // Next Button
                  ElevatedButton(
                    onPressed: () {
                      if (!_isLoading) {
                        signup();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      backgroundColor: const Color(0xFFFF4757), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5, // Add shadow
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

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
      ),
    );
  }

  // Helper method to build TextFormField widgets
  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white12, // Field background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15), // Add padding inside TextField
        ),
        style: const TextStyle(color: Colors.white),
        validator: validator,
      ),
    );
  }
}
