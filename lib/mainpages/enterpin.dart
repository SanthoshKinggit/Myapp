// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myapp/others/prime.dart';
import 'package:myapp/setfinger.dart';

class PinEnterScreen extends StatefulWidget {
  @override
  _PinEnterScreenState createState() => _PinEnterScreenState();
}

class _PinEnterScreenState extends State<PinEnterScreen> {
  // Create list of text controllers and focus nodes for each PIN digit
  final List<TextEditingController> _pinControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _pinFocusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    // Dispose controllers and focus nodes to prevent memory leaks
    for (var controller in _pinControllers) {
      controller.dispose();
    }
    for (var focusNode in _pinFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width * 0.90;
    final screenHeight = screenSize.height * 0.90;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight * 1.1, // Slightly more than screen height
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 53, 0, 48),
                  Color.fromARGB(255, 117, 0, 106),
                  Color.fromARGB(255, 255, 0, 230),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.03),

                    // Back Button
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Text(
                          '   Enter Your PIN',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            color: Colors.amber,
                            fontFamily: 'Nunito',
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),

                    // Logo
                    Image.asset(
                      'assets/logo/Screenshot_2024-11-27_143845-removebg-preview.png',
                      height: 160,
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Title
                    Text(
                      'Add a PIN number to make your account more secure',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w200,
                        color: const Color.fromARGB(255, 255, 145, 0),
                        fontFamily: 'Nunito',
                        letterSpacing: 1.2,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Text(
                    //   'Secure your account with a 4-digit PIN',
                    //   style: TextStyle(
                    //     fontSize: screenWidth * 0.04,
                    //     fontFamily: 'Nunito',
                    //     color: Colors.white70,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),

                    SizedBox(height: screenHeight * 0.05),

                    // PIN Input Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Container(
                          width: screenWidth * 0.15,
                          height: screenHeight * 0.08,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: primary.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _pinControllers[index],
                            focusNode: _pinFocusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            obscureText: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              fontFamily: 'Nunito',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.deepPurple.shade300,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              // Automatically move to next field when a digit is entered
                              if (value.length == 1) {
                                if (index < 3) {
                                  FocusScope.of(context)
                                      .requestFocus(_pinFocusNodes[index + 1]);
                                } else {
                                  // Last field - remove focus
                                  _pinFocusNodes[index].unfocus();
                                }
                              }
                            },
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: screenHeight * 0.1),

                    // Create MPIN Button
                    Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                             const Color.fromARGB(255, 53, 0, 48),
                                      const Color.fromARGB(255, 117, 0, 106),
                                      const Color.fromARGB(255, 255, 0, 230),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate PIN input
                          String pin = _pinControllers
                              .map((controller) => controller.text)
                              .join();
                          if (pin.length == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetFingerprintScreen()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please enter a complete 4-digit PIN'),
                                backgroundColor: primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 80.0, vertical: 10.0),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Enter MPIN',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Need Help Button
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text('Contact support for assistance'),
                            backgroundColor: Colors.deepPurple.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(
                                horizontal: 80.0, vertical: 10.0),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Text(
                        'Need Help?',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito',
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
