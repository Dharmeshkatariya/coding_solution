import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: LoaderPainter(_controller.value),
            child: Container(
              width: 100.0,
              height: 100.0,
            ),
          );
        },
      ),
    );
  }
}

class LoaderPainter extends CustomPainter {
  final double value;

  LoaderPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final center = size.center(Offset.zero);
    final radius = size.width * 0.4;

    final startAngle = 0.0;
    final endAngle = 2 * value * 3.14;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      endAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
