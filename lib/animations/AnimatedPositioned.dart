import 'package:flutter/material.dart';

class Animatedpositioned extends StatefulWidget {
  const Animatedpositioned({super.key});

  @override
  State<Animatedpositioned> createState() => _AnimatedpositionedState();
}

class _AnimatedpositionedState extends State<Animatedpositioned> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          children: [
            AnimatedPositioned(
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              top: selected ? 100.0 : 150.0,
              right: selected ? 100.0 : 150,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutQuart,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: const ColoredBox(
                  color: Colors.blue,
                  child: Center(child: Text('Tap me')),
                ),
              ),
            )
          ]
      ),
    );
  }
}
