import 'package:flutter/material.dart';

class Scaletransition extends StatefulWidget {
  const Scaletransition({super.key});

  @override
  State<Scaletransition> createState() => _ScaletransitionState();
}

class _ScaletransitionState extends State<Scaletransition>with TickerProviderStateMixin {

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.elasticOut,
  );


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}
