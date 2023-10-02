import 'package:flutter/material.dart';
import 'dart:math';

class MyGame extends StatefulWidget {
  @override
  _MyGameState createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  double circleTop = 100.0;
  double circleLeft = 100.0;
  double score = 0.0;

  void _handleTap() {
    setState(() {
      // Move the circle to a random position within the screen boundaries
      final random = Random();
      circleTop = random.nextDouble() * (MediaQuery.of(context).size.height - 50);
      circleLeft = random.nextDouble() * (MediaQuery.of(context).size.width - 50);

      // Increase the score
      score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap the Circle Game'),
      ),
      body: GestureDetector(
        onTap: _handleTap,
        child: Stack(
          children: [
            Positioned(
              top: circleTop,
              left: circleLeft,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            score = 0;
          });
        },
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Text(
            'Score: $score',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
