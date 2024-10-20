import 'package:flutter/material.dart';
import 'package:pulse/BottomNav/BottomNav.dart';
import 'package:pulse/Database/Auth.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/SignUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final TextEditingController _emailController = TextEditingController(); // Controller for email
  final TextEditingController _passwordController = TextEditingController(); // Controller for password
  bool _termsAccepted = false; // Checkbox state for Terms and Conditions
  bool _passwordVisible = false; // Track visibility of password
  final auth = AUTH();

  // Email validation regex
  final RegExp _emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  void login()async{
    final status = await auth.signIn(_emailController.text, _passwordController.text, context);
    if(status){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNav()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
              key: _formKey, // Assign the form key
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
                  _buildTextField(
                    controller: _emailController,
                    icon: Icons.email,
                    hintText: 'Valid email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!_emailRegExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
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
                    showEyeIcon: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
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
                      if (_formKey.currentState!.validate()) {
                        if (_termsAccepted) {
                          // Navigate to HomeScreen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please accept the terms and conditions'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
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

                  // Already a member? Sign up
                  GestureDetector(
                    onTap: () {
                      // Navigate to SignUp page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: RichText(
                      text:const TextSpan(
                        text: 'Not a member? ',
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
      ),
    );
  }

  // Helper method to build TextFormField with validation
  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    required String? Function(String?) validator,
    bool obscureText = false,
    bool showEyeIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText && !_passwordVisible,
        validator: validator,
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
          suffixIcon: showEyeIcon
              ? IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white70,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          )
              : null,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
