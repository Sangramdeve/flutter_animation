import 'package:flutter/material.dart';
import 'dart:math' as math;


class Animatedwidget extends StatefulWidget {
  const Animatedwidget({super.key});

  @override
  State<Animatedwidget> createState() => _AnimatedwidgetState();
}

class _AnimatedwidgetState extends State<Animatedwidget>with SingleTickerProviderStateMixin{

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    Future.delayed(Duration(seconds: 3), () {
      controller.stop();
    });
  }


  @override
  Widget build(BuildContext context) {
    return SpinningContainer(controller: controller);
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({super.key, required AnimationController controller,})
      : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: FlutterLogo(size: 30,),
      ),
    );
  }
}