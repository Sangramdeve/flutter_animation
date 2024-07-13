import 'package:flutter/material.dart';

class Slidetransition extends StatefulWidget {
  const Slidetransition({super.key});

  @override
  State<Slidetransition> createState() => _SlidetransitionState();
}

class _SlidetransitionState extends State<Slidetransition> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.0,1.5,),
  ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
            position: _animation,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(size: 150.0),
            )
        ),
      ),
    );
  }
}
