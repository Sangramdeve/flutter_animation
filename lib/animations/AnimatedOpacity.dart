import 'package:flutter/material.dart';

class Animatedopacity extends StatefulWidget {
  const Animatedopacity({super.key});

  @override
  State<Animatedopacity> createState() => _AnimatedopacityState();
}

class _AnimatedopacityState extends State<Animatedopacity> {

  double opacityLevel = 1.0;

  void _changeOpacity(){
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(milliseconds: 500),
          child: const FlutterLogo(size: 60,),
        ),
        ElevatedButton(
          onPressed: _changeOpacity,
          child: const Text('Fade Logo'),
        ),
      ],
    );
  }
}
