import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  double progress = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();

    // Simulate loading progress for demonstration purposes
    simulateLoading();
  }

  void simulateLoading() async {
    for (double i = 0; i < 1.0; i += 0.01) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        progress = i;
      });
    }

    // Navigate to the home screen when loading is complete
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: controller.value * 6.3, // 6.3 radians = 360 degrees
                  child: FlutterLogo(
                    size: 100.0,
                    style: FlutterLogoStyle.stacked,
                    // colors: Colors.white,
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(
              value: progress,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 20.0),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
