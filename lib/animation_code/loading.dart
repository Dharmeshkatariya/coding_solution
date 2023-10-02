// import 'dart:async';
// import 'package:flutter/material.dart';
//
//
//
// class LoadingScreen extends StatefulWidget  {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//
//     _colorAnimation = ColorTween(
//       begin: Colors.blue,
//       end: Colors.green,
//     ).animate(_controller);
//
//     _controller.repeat(reverse: true);
//
//     _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
//       // Change the background color every 3 seconds
//       _controller.forward().then((_) {
//         _controller.reverse();
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Container(
//             color: _colorAnimation.value,
//             child: Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
