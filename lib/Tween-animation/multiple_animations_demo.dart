import 'package:flutter/material.dart';

class MultipleAnimationsDemo extends StatefulWidget {
  const MultipleAnimationsDemo({super.key});

  @override
  State<MultipleAnimationsDemo> createState() => _MultipleAnimationsDemoState();
}

class _MultipleAnimationsDemoState extends State<MultipleAnimationsDemo>
    with TickerProviderStateMixin {
  late AnimationController positionController;
  late AnimationController scaleController;
  late AnimationController rotationController;
  late AnimationController colorController;

  late Animation<Offset> positionAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> rotationAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    positionController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    positionAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(200, 300)).animate(
      CurvedAnimation(parent: positionController, curve: Curves.easeInOut),
    );


    scaleController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    rotationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(parent: rotationController, curve: Curves.easeInOut),
    );

    colorController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.purple).animate(
        CurvedAnimation(parent: colorController, curve: Curves.easeInOut));

    startAnimation();
  }

  void startAnimation() {
    positionController.repeat(reverse: true);
    scaleController.repeat(reverse: true);
    rotationController.repeat(reverse: true);
    colorController.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    positionController.dispose();
    scaleController.dispose();
    rotationController.dispose();
    colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: Listenable.merge([
            positionController,
            scaleController,
            rotationController,
            colorController
          ]),
          builder: (context, _) {
            return Transform.translate(
              offset: positionAnimation.value,
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: Transform.rotate(
                  angle: rotationAnimation.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: colorAnimation.value,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
