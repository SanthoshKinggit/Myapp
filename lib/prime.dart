// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

const primary = Colors.amber;
const fonts = 'Nunito';


// class BackgroundUIDesign extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFF5B7CFA),
//               Color(0xFF3B5998),
//             ],
//           ),
//         ),
//         child: Stack(
//           children: [
//             // Background circles
//             Positioned(
//               top: -60,
//               left: -80,
//               child: Container(
//                 width: 300,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFFDEE8FF),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: -100,
//               right: -100,
//               child: Container(
//                 width: 300,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFF7EA1F9),
//                 ),
//               ),
//             ),

//             // Content
//           ],
//         ),
//       ),
//     );
//   }
// }
// // gradient: AppColors.goldGradient,
// //  gradient: AppColors.blackGradient,

// // AppColors.purpleColor,
// // AppColors.secondaryColor,
// // AppColors.primaryColor,

// //   return AppColors.textGradient.createShader(bounds);


// // ShaderMask(

// //                       shaderCallback: (bounds) {
// //     return AppColors.text2Gradient.createShader(bounds);
// //   },
// //                       child: Text(
// //                         "See All",
// //                         style: TextStyle(color: AppColors.primaryColor,fontFamily: 'Nunito'), // Blue
// //                       ),
// //           ),