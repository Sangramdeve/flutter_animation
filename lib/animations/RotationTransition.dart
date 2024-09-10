import 'package:flutter/material.dart';

class Rotationtransition extends StatefulWidget {
  const Rotationtransition({super.key});

  @override
  State<Rotationtransition> createState() => _RotationtransitionState();
}

class _RotationtransitionState extends State<Rotationtransition> with TickerProviderStateMixin{

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: RotationTransition(
            turns: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}
