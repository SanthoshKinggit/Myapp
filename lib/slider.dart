// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'prime.dart';
import 'signup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Animation controllers
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _buttonController;

  // Animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> buttonScaleAnimation;
  late Animation<double> _buttonFadeAnimation;

  final List<Map<String, dynamic>> _contents = [
    {
      'title': 'Order & Service',
      'description':
          'Your order, your convenience. Explore, select, and save like never before!',
      'image': 'assets/logo/4706264-removebg-preview.png',
      'gradient': [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    },
    {
      'title': ' Online Shopping',
      'description':
          'Discover a world of endless possibilities at your fingertips!',
      'image': 'assets/logo/gfdgfdg-removebg-preview.png',
      'gradient': [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    },
    {
      'title': 'Fastest Payment',
      'description': 'Manage finances easily with secure and Fast payments',
      'image': 'assets/logo/29169-removebg-preview.png',
      'gradient': [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    },
  ];

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    // Setup animations
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutBack,
    ));

    buttonScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Curves.elasticOut,
    ));

    _buttonFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Interval(0.4, 1.0, curve: Curves.easeOut),
    ));

    // Start initial animations
    Future.delayed(Duration(milliseconds: 100), () {
      _fadeController.forward();
      _slideController.forward();
      _scaleController.forward();
      _buttonController.forward();
    });
  }

  void _animateToNextPage() {
    // Reset animations
    _fadeController.reset();
    _slideController.reset();
    _scaleController.reset();

    // Animate to next page
    if (_currentIndex < _contents.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    // Start animations for new page
    Future.delayed(Duration(milliseconds: 100), () {
      _fadeController.forward();
      _slideController.forward();
      _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
            child: Stack(children: [
              // Background circles
              Positioned(
                top: -10,
                left: -25,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 12, 12, 12),
                      Colors.purple,
                    ]),
                    shape: BoxShape.circle,
                    color: Color(0xFFDEE8FF),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 280,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 255, 255, 255),
                      Colors.purple
                    ]),
                    shape: BoxShape.circle,
                    color: Color(0xFFDEE8FF),
                  ),
                ),
              ),
              Positioned(
                top: 340,
                left: 40,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 182, 37, 255),
                    ]),
                    shape: BoxShape.circle,
                    color: Color(0xFF7EA1F9),
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                right: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 12, 12, 12),
                      Colors.purple,
                    ]),
                    shape: BoxShape.circle,
                    color: Color(0xFF7EA1F9),
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    // Skip Button
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.01,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ScaleTransition(
                          scale: buttonScaleAnimation,
                          child: SizedBox(
                            height: 46,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Onboarding Content
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                            _fadeController.reset();
                            _fadeController.forward();
                            _slideController.reset();
                            _slideController.forward();
                            _scaleController.reset();
                            _scaleController.forward();
                          });
                        },
                        itemCount: _contents.length,
                        itemBuilder: (context, index) {
                          return FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: ScaleTransition(
                                scale: _scaleAnimation,
                                child: OnboardingContent(
                                  title: _contents[index]['title'],
                                  description: _contents[index]['description'],
                                  image: _contents[index]['image'],
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Bottom Navigation and Button
                    ScaleTransition(
                      scale: buttonScaleAnimation,
                      child: FadeTransition(
                        opacity: _buttonFadeAnimation,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                            vertical: screenHeight * 0.03,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Page Indicator
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  _contents.length,
                                  (index) => TweenAnimationBuilder(
                                    duration: Duration(milliseconds: 300),
                                    tween: Tween<double>(
                                      begin: 0.0,
                                      end: _currentIndex == index ? 1.0 : 0.5,
                                    ),
                                    builder: (context, double value, child) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        height: 8,
                                        width: _currentIndex == index ? 24 : 8,
                                        decoration: BoxDecoration(
                                          color:
                                              const Color.fromARGB(255, 255, 255, 255).withOpacity(value),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),

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
                                    if (_currentIndex == _contents.length - 1) {
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              LoginScreen(),
                                        ),
                                      );
                                    } else {
                                      _animateToNextPage();
                                    }
                                  },
                                  child: Center(
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return LinearGradient(
                                          colors: [
                                            const Color.fromARGB(
                                                255, 255, 247, 175),
                                            const Color.fromARGB(
                                                255, 192, 144, 0),
                                            const Color.fromARGB(
                                                255, 255, 250, 205)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ).createShader(bounds);
                                      },
                                      child: Text(
                                        _currentIndex == _contents.length - 1
                                            ? 'Get Started'
                                            : 'Next',
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
                              SizedBox(height: screenHeight * 0.03),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final double screenWidth;
  final double screenHeight;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                    SizedBox(height: screenHeight * 0.08),

          Image.asset(
            image,
            height: screenHeight * 0.35,
            width: screenWidth * 0.97,
            fit: BoxFit.contain,
          ),
          SizedBox(height: screenHeight * 0.03),

          // Title and Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                Center(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 255, 247, 175),
                          const Color.fromARGB(255, 192, 144, 0),
                          const Color.fromARGB(255, 255, 250, 205)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        color: Colors
                            .white, // This color is ignored due to ShaderMask
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    height: 1.5,
                    fontFamily: 'Nunito',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
