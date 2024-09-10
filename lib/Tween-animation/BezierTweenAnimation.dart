import 'package:flutter/material.dart';

class BezierTweenAnimation extends StatefulWidget {
  const BezierTweenAnimation({super.key});

  @override
  State<BezierTweenAnimation> createState() => _BezierTweenAnimationState();
}

class _BezierTweenAnimationState extends State<BezierTweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    const cubicCurve =   Cubic(0,1.9,.99,-0.65);

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(300, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: cubicCurve,
    ));


  }

  void _startAnimation(){
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bézier Tween Animation')),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: _animation.value,
                  child: child,
                );
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _startAnimation,
            child: Text('Start Animation'),
          ),
          Spacer(),

        ],
      ),
    );
  }
}
