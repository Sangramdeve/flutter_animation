import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleExample extends StatefulWidget {
  const AnimatedDefaultTextStyleExample({super.key});

  @override
  State<AnimatedDefaultTextStyleExample> createState() => _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState extends State<AnimatedDefaultTextStyleExample> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          color: Colors.blue,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutBack,
            style: isSelected
                ? const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
                : const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            child: const Center(child: Text('Flutter')),
          ),
        ),
      ),
    );
  }
}

