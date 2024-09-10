import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(MaterialApp(home: FrictionAnimationDemo()));
}

class FrictionAnimationDemo extends StatefulWidget {
  @override
  _FrictionAnimationDemoState createState() => _FrictionAnimationDemoState();
}

class _FrictionAnimationDemoState extends State<FrictionAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late FrictionSimulation _frictionSimulation;
  double _position = 0.0;

  @override
  void initState() {
    super.initState();

    // Set up the controller without predefined bounds
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {
          _position = _controller.value;
        });
      });

    // Define a FrictionSimulation with drag and initial velocity
    _frictionSimulation = FrictionSimulation(0.5,0.0, 500.0);

    // Start the friction animation
    _controller.animateWith(_frictionSimulation);
  }

  void _startAnimation() {
    _controller.animateWith(_frictionSimulation);
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Friction Animation')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Transform.translate(
            offset: Offset(_position, 0), // Moves horizontally with friction
            child: Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _startAnimation,
              child: const Text('Start Animation'),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
