// ignore_for_file: unused_import, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';

import 'fillprofile.dart';
import 'loginpage.dart';
import 'pages/signin.dart';
import 'prime.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06, // Responsive horizontal padding
              // Responsive vertical padding
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.03),

                  // Back Button
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign up to\nCreate your Account',
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
                    hintText: 'Email ',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: _isEmailValid,
                    screenWidth: screenWidth,
                  ),
                  SizedBox(height: screenHeight * 0.03),

                   _buildTextField(
                    controller: _emailController,
                    hintText: 'Phone Number',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: _isEmailValid,
                    screenWidth: screenWidth,
                  ),

                  SizedBox(height: screenHeight * 0.03),

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
                  _buildTextField(
                    controller: _passwordController,
                    hintText: 'Confirm Password',
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
                          borderRadius: BorderRadius.circular(33),
                        ),
                        side: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)!),
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: screenWidth * 0.040,
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
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlertBoxScreen()),
                                      );
                                    
                                    // Add sign-in logic here
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
                                        'Next',
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color: Colors.white,
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                  SizedBox(height: screenHeight * 0.03),

                  // Divider with text
                  _buildDividerWithText(screenWidth),

                  SizedBox(height: screenHeight * 0.07),

                  // Social Login Icons
                  _buildSocialLoginRow(screenWidth),

                  SizedBox(height: screenHeight * 0.06),

                  // Sign in link
                  _buildSignInLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom TextField Builder
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
          fontSize: screenWidth * 0.05,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[500],
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(33),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        // errorText: validator(controller.text) ? null : _getErrorText(hintText),
      ),
    );
  }

  // Divider with text in the middle
  Widget _buildDividerWithText(double screenWidth) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Text(
            'or continue with',
            style: TextStyle(
              fontFamily: 'Nunito',
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: screenWidth * 0.040,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }

  // Social Login Icons
  Widget _buildSocialLoginRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialIcon(
          'assets/logo/Facebook_Logo_2023.png',
          height: screenWidth * 0.10,
        ),
        _buildSocialIcon(
          'assets/logo/Google_Icons-09-512.webp',
          height: screenWidth * 0.13,
        ),
        _buildSocialIcon(
          'assets/logo/apple-logo-transparent.png',
          height: screenWidth * 0.10,
        ),
      ],
    );
  }

  // Social Icon Builder
  Widget _buildSocialIcon(String imagePath, {double? height}) {
    return GestureDetector(
      onTap: () {
        // Show a dialog or alert for social login
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Social login coming soon!'),
            );
          },
        );
      },
      child: Image.asset(imagePath, height: height),
    );
  }

  // Sign In Link
  Widget _buildSignInLink() {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Signinscreen()),
          );
        },
        child: RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
              fontFamily: 'Nunito',
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 14,
            ),
            children: const [
              TextSpan(
                text: "Sign in",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Validation methods
  bool _isEmailValid(String email) {
    if (email.isEmpty) {
      return false;
    }
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    if (password.isEmpty) {
      return false;
    }
    return password.length >= 6;
  }

  // String _getErrorText(String field) {
  //   switch (field) {
  //     case 'Email':
  //       return 'Enter a valid email';
  //     case 'Password':
  //       return 'Password must be at least 6 characters';
  //     default:
  //       return 'This field cannot be empty';
  //   }
  // }

  // Check if the form is valid
  bool _isFormValid() {
    return _isEmailValid(_emailController.text) &&
        _isPasswordValid(_passwordController.text);
  }

  // Handle sign up
  void _handleSignUp() {
    // Perform sign-up logic, e.g., saving data or API calls
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage0()),
    );
  }
}
