import 'package:flutter/material.dart';

class Animatedsize extends StatefulWidget {
  const Animatedsize({super.key});

  @override
  State<Animatedsize> createState() => _AnimatedsizeState();
}

class _AnimatedsizeState extends State<Animatedsize> {

  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => _updateSize(),
          child: ColoredBox(
            color: Colors.amberAccent,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              child: FlutterLogo(size: _size),
            ),
          ),
        ),
      ),
    );
  }
}
