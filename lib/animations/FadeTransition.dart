import 'package:flutter/material.dart';

class Fadetransition extends StatefulWidget {
  const Fadetransition({super.key});

  @override
  State<Fadetransition> createState() => _FadetransitionState();
}

class _FadetransitionState extends State<Fadetransition> with TickerProviderStateMixin{

  late final AnimationController controller = AnimationController(
    duration: Duration(seconds: 3),
      vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn
  );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  ColoredBox(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(padding: EdgeInsets.all(50), child: FlutterLogo()),
      ),
    );
  }
}
