import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class GravityAnimationDemo extends StatefulWidget {
  const GravityAnimationDemo({super.key});

  @override
  State<GravityAnimationDemo> createState() => _GravityAnimationDemoState();
}

class _GravityAnimationDemoState extends State<GravityAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late GravitySimulation _gravitySimulation;
  double _position = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        setState(() {
          _position = _controller.value;
        });
      });

    _gravitySimulation = GravitySimulation(9.8, 0.0, 500, 0);

  }

  void _startAnimation() {
    _controller.animateWith(_gravitySimulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Center(
            child: Transform.translate(
              offset: Offset(0, _position),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
          ),
          Spacer(),
          Center(
            child: ElevatedButton(onPressed: _startAnimation, child: Text('start Animation')),
          )
        ],
      ),
    );
  }
}
