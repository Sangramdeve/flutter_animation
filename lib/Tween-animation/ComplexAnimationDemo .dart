import 'package:flutter/material.dart';

class ComplexAnimationDemo extends StatefulWidget {
  @override
  _ComplexAnimationDemoState createState() => _ComplexAnimationDemoState();
}

class _ComplexAnimationDemoState extends State<ComplexAnimationDemo>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late AnimationController rotationController;
  late AnimationController opacityController;
  late AnimationController positionController;

  late Animation<double> scaleAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> opacityAnimation;
  late Animation<Offset> positionAnimation;

  @override
  void initState() {
    super.initState();

    // Scale Animation
    scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    // Rotation Animation
    rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(parent: rotationController, curve: Curves.easeInOut),
    );

    // Opacity Animation
    opacityController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: opacityController, curve: Curves.easeInOut),
    );

    // Position Animation
    positionController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    positionAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(1, 1)).animate(
      CurvedAnimation(parent: positionController, curve: Curves.easeInOut),
    );

    // Start all animations simultaneously
    startAnimations();
  }

  void startAnimations() {
    scaleController.repeat(reverse: true);
    rotationController.repeat(reverse: true);
    opacityController.repeat(reverse: true);
    positionController.repeat(reverse: true);
  }

  @override
  void dispose() {
    scaleController.dispose();
    rotationController.dispose();
    opacityController.dispose();
    positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex Animation Demo')),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            scaleController,
            rotationController,
            opacityController,
            positionController,
          ]),
          builder: (context, child) {
            return Transform.translate(
              offset: positionAnimation.value * 100, // Adjust the position offset
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: Transform.rotate(
                  angle: rotationAnimation.value,
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Animate',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
