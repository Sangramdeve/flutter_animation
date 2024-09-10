import 'package:flutter/material.dart';

class MultiTweenAnimationDemo extends StatefulWidget {
  const MultiTweenAnimationDemo({super.key});

  @override
  State<MultiTweenAnimationDemo> createState() => _AnimationWidgetsState();
}

class _AnimationWidgetsState extends State<MultiTweenAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    sizeAnimation = Tween<double>(begin: 50, end: 200)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          AnimatedBuilder(animation: controller, builder: (context, child) {
            return Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              color: colorAnimation.value,
            );
          }),
    );
  }
}
