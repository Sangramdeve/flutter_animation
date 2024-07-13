import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animatedbuilder extends StatefulWidget {
  const Animatedbuilder({super.key});

  @override
  State<Animatedbuilder> createState() => _AnimatedbuilderState();
}

class _AnimatedbuilderState extends State<Animatedbuilder>with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 10),
      vsync: this,
  )..repeat();

  bool isSelected = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              //scale: 5,
              //scaleX: 4,
              //scaleY: 4,
              //flipX: true,
              //flipY: true,
              //origin: Offset(4, 5),
              angle: _controller.value*5.0* math.pi,
              child: child,
            );
          },
          child: const FlutterLogo(size: 100.0),

        ),
      ),
    );
  }
}
