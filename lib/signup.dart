import 'package:flutter/material.dart';
import 'dart:math' as math;

// Import necessary pages (adjust imports as needed)
import 'package:myapp/accountacreate.dart';
import 'package:myapp/createac.dart';
import 'package:myapp/others/login.dart';
import 'package:myapp/prime.dart';
import 'package:myapp/pages/signin.dart';
import 'package:myapp/others/primarycolor.dart';
import 'package:myapp/slider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<AnimatedCircle> _animatedCircles;

  @override
  void initState() {
    super.initState();
    // Create an animation controller that runs continuously
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    // Initialize animated circles
    _animatedCircles = List.generate(6, (index) => AnimatedCircle());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
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
                // Animated circles background
                ..._animatedCircles.map((animatedCircle) => 
                  Positioned(
                    top: animatedCircle.position.dy,
                    left: animatedCircle.position.dx,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: animatedCircle.getPulseScale(_animationController.value),
                          child: Transform.rotate(
                            angle: _animationController.value * 2 * math.pi,
                            child: Container(
                              width: animatedCircle.size,
                              height: animatedCircle.size,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: animatedCircle.colors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: animatedCircle.colors[0].withOpacity(0.5),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ).toList(),

                // Login Screen Content
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: screenHeight,
                      minWidth: screenWidth,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.06,
                          vertical: screenHeight * 0.00,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Logo
                              Image.asset(
                                'assets/logo/final logo-23.png',
                                height: 150,
                                width: 200,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              
                              // Title
                              Text(
                                'Login with',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: screenWidth * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber
                                ),
                              ),
                              
                              SizedBox(height: screenHeight * 0.04),
                              
                              // Social Login Buttons
                              _buildSocialLoginButton(
                                context,
                                'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
                                'Continue with Facebook',
                                isNetwork: true,
                              ),
                              
                              SizedBox(height: screenHeight * 0.01),
                              
                              _buildSocialLoginButton(
                                context,
                                'assets/logo/Google_Icons-09-512.webp',
                                'Continue with Google',
                              ),
                              
                              SizedBox(height: screenHeight * 0.01),
                              
                              _buildSocialLoginButton(
                                context,
                                'assets/logo/apple-logo-transparent.png',
                                'Continue with Apple',
                              ),
                              
                              SizedBox(height: screenHeight * 0.04),
                              
                              // Divider
                              Row(
                                children: [
                                  Expanded(child: Divider(color: Colors.grey)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.03),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                        color:  Colors.white,
                                        fontFamily: 'Nunito',
                                        fontSize: screenWidth * 0.04,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Divider(color: Colors.grey)),
                                ],
                              ),
                              
                              SizedBox(height: screenHeight * 0.03),
                              
                              // Sign In Button
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
                                            builder: (context) => Signinscreen()),
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
                                        'Sign in',
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
                              
                              SizedBox(height: screenHeight * 0.02),
                              
                              // Sign Up Text
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage1()),
                                      );
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: screenWidth * 0.035,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper method to build social login buttons
  Widget _buildSocialLoginButton(
      BuildContext context, String imagePath, String text,
      {bool isNetwork = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const LoginScreen2()),
        // );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        minimumSize: Size(screenWidth * 0.9, screenHeight * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(33),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isNetwork
              ? Image.network(imagePath, height: screenHeight * 0.035)
              : Image.asset(imagePath, height: screenHeight * 0.035),
          SizedBox(width: screenWidth * 0.03),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCircle {
  final Offset position;
  final double size;
  final List<Color> colors;
  final double pulseSpeed;

  AnimatedCircle({
    Offset? position,
    double? size,
    List<Color>? colors,
    double? pulseSpeed,
  }) : 
    position = position ?? Offset(
      math.Random().nextDouble() * 350,
      math.Random().nextDouble() * 600
    ),
    size = size ?? (30 + math.Random().nextDouble() * 100),
    colors = colors ?? [
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.7),
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.7),
    ],
    pulseSpeed = pulseSpeed ?? (0.5 + math.Random().nextDouble());

  double getPulseScale(double animationValue) {
    // Create a pulsing effect with random variation
    return 1 + (math.sin(animationValue * math.pi * pulseSpeed) * 0.2);
  }
}