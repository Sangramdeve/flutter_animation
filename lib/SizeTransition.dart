import 'package:flutter/material.dart';

class Sizetransition extends StatefulWidget {
  const Sizetransition({super.key});

  @override
  State<Sizetransition> createState() => _SizetransitionState();
}

class _SizetransitionState extends State<Sizetransition> with TickerProviderStateMixin{


  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: Center(
          child: FlutterLogo(size: 200.0),
        ),
      ),
    );
  }
}
