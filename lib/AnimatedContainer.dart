import 'package:flutter/material.dart';

class Animatedcontainer extends StatefulWidget {
  const Animatedcontainer({super.key});

  @override
  State<Animatedcontainer> createState() => _AnimatedcontainerState();
}

class _AnimatedcontainerState extends State<Animatedcontainer> {


  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.red : Colors.blue,

          ),
          width: isSelected ? 200.0 : 100.0,
          height: isSelected ? 200.0 : 100.0,

          alignment:
          isSelected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.elasticInOut,
          child: Center(child: const FlutterLogo(size: 55)),
        ),
      ),
    );
  }
}
