import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PendulumAnimationDemo extends StatefulWidget {
  const PendulumAnimationDemo({super.key});

  @override
  State<PendulumAnimationDemo> createState() => _PendulumAnimationDemoState();
}

class _PendulumAnimationDemoState extends State<PendulumAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Simulation _simulation;
  double angle = pi / 4;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {
          angle = sin(_controller.value) * pi / 4;
        });
      });

    _simulation = SpringSimulation(
        const SpringDescription(mass: 1, stiffness: 300, damping: 5),
        0,
        2 * pi,
        0);
   // _controller.animateWith(_simulation);
  }

  void _startAnimation(){
    _controller.animateWith(_simulation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pendulum Animation')),
      body: Column(
        children: [
          Center(
            child: CustomPaint(
              painter: PendulumPainter(angle),
              child: Container(
                width: 300,
                height: 300,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _startAnimation,
            child: Text('Start Animation'),
          ),
        ],
      ),
    );
  }
}

class PendulumPainter extends CustomPainter {
  final double angle;

  PendulumPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    final Offset anchor = Offset(size.width / 2, 0);

    final Offset bobPosition =
        Offset(anchor.dx + 100 * sin(angle), anchor.dy + 200 * cos(angle));
    canvas.drawLine(anchor, bobPosition, paint);
    canvas.drawCircle(bobPosition, 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
