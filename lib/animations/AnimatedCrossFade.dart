import 'package:flutter/material.dart';

class Animatedcrossfade extends StatefulWidget {
  const Animatedcrossfade({super.key});

  @override
  State<Animatedcrossfade> createState() => _AnimatedcrossfadeState();
}

class _AnimatedcrossfadeState extends State<Animatedcrossfade> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(
        onTap: (){
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: AnimatedCrossFade(
          firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 200.0),
          secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
          crossFadeState: isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),

        ),
      ),
    );
  }
}
