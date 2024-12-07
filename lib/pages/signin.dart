// ignore_for_file: prefer_const_constructors, unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:myapp/createac.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/mainpages/enterpin.dart';
import 'package:myapp/others/forgot.dart';
import 'package:myapp/fillprofile.dart';
import 'package:myapp/setfinger.dart';
import 'package:myapp/mainpages/createpin.dart';
import 'package:myapp/others/prime.dart';
import 'package:myapp/others/profile.dart';
import 'package:myapp/mainpages/step.dart';

import 'forgotpass.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  // Add controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width * 0.90;
    final screenHeight = MediaQuery.of(context).size.height * 0.90;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              const Color.fromARGB(255, 61, 6, 68),
              const Color.fromARGB(255, 153, 22, 170),
            ],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    screenWidth * 0.06, // Responsive horizontal padding
                // Responsive vertical padding
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
            
                    // Back Button
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),
            
                    // Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign in\nYour Account',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          height: 1.2,
                        ),
                      ),
                    ),
            
                    SizedBox(height: screenHeight * 0.05),
                    // Email TextField
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: _isEmailValid,
                      screenWidth: screenWidth,
                    ),
            
                    SizedBox(height: screenHeight * 0.04),
            
                    // Password TextField
                    _buildTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: !_isPasswordVisible,
                      validator: _isPasswordValid,
                      screenWidth: screenWidth,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey[500],
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
            
                    SizedBox(height: screenHeight * 0.03),
            
                    // Remember me checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(color: Colors.grey[500]!),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
            
                    SizedBox(height: screenHeight * 0.03),
            
                    // Sign up button
                    Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 53, 0, 48),
                            const Color.fromARGB(255, 117, 0, 106),
                            const Color.fromARGB(255, 255, 0, 230),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Transparent to show the gradient
                          shadowColor: Colors
                              .transparent, // No shadow for clean gradient
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PinEnterScreen()),
                          );
            
                          final snackBar = SnackBar(
                            content: Center(child: Text('Login Successful')),
                            backgroundColor: primary, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Apply border radius
                            ),
            
                            behavior: SnackBarBehavior
                                .floating, // Make the SnackBar floating
                            margin: EdgeInsets.symmetric(
                                horizontal: 80.0,
                                vertical: 10.0), // Margin to center it
                            duration: Duration(
                                seconds: 3), // Snackbar display duration
                          );
            
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar); // Show
                        },
                        child: Center(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 255, 247, 175),
                                  const Color.fromARGB(255, 255, 234, 41),
                                  const Color.fromARGB(255, 192, 144, 0),
                                  const Color.fromARGB(255, 255, 250, 205)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors
                                    .white, // Contrast color for better readability
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
            
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: const Color.fromARGB(255, 255, 196, 0),
                            fontSize: screenSize.width * 0.035,
                          ),
                        )),
                    const SizedBox(height: 22),
                    Center(
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: screenSize.width * 0.035,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
                          height: screenSize.width * 0.063,
                        ),
                        Image.asset(
                          'assets/logo/Google_Icons-09-512.webp',
                          height: screenSize.width * 0.1,
                        ),
                        Image.asset(
                          'assets/logo/apple-logo-transparent.png',
                          height: screenSize.width * 0.08,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
            
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage1()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Create New Account ",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: screenSize.width * 0.035,
                            ),
                            children: const [
                              TextSpan(
                                text: "Create Account",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required bool Function(String) validator,
    required double screenWidth,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      onChanged: (value) {
        setState(() {}); // Rebuild to show validation
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontFamily: 'Nunito',
          fontSize: screenWidth * 0.04,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[500],
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        // errorText: validator(controller.text) ? null : _getErrorText(hintText),
      ),
    );
  }

  // Validation methods
  bool _isEmailValid(String email) {
    if (email.isEmpty) return true; // Don't show error for empty field
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    if (password.isEmpty) return true; // Don't show error for empty field
    return password.length >= 6;
  }

  bool _isFormValid() {
    return _isEmailValid(_emailController.text) &&
        _isPasswordValid(_passwordController.text) &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  bool _canSubmit() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
