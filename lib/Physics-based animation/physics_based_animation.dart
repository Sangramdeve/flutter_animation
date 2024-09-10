import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsBasedAnimationDemo extends StatefulWidget {
  const PhysicsBasedAnimationDemo({super.key});

  @override
  State<PhysicsBasedAnimationDemo> createState() =>
      _PhysicsBasedAnimationDemoState();
}

class _PhysicsBasedAnimationDemoState extends State<PhysicsBasedAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SpringSimulation springSimulation;
  double position = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {
          position = controller.value;
        });
      });
    springSimulation = SpringSimulation(
        const SpringDescription(mass: 1, stiffness: 300, damping: 5)
        , 0, 1, 0);

  }

  void _startAnimation() {
    controller.animateWith(springSimulation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Physics-Based Animation')),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Transform.translate(
              offset: Offset(0, 300 * (1 - position)),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _startAnimation,
              child: const Text('Start Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
