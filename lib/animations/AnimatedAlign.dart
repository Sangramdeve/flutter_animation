import 'package:flutter/material.dart';

class Animatedalign extends StatefulWidget {
  const Animatedalign({super.key});

  @override
  State<Animatedalign> createState() => _AnimatedalignState();
}

class _AnimatedalignState extends State<Animatedalign> with TickerProviderStateMixin {
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
        child: Container(
            height: 250,
            width: 250,
            color: Colors.blue,
            child: AnimatedAlign(
              alignment: isSelected ? Alignment.topLeft:Alignment.bottomRight,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              child: Padding(
                padding: EdgeInsets.all(20),
                  child: const FlutterLogo(size: 50.0)
              ),
            )
        ),
      ),
    );
  }
}
