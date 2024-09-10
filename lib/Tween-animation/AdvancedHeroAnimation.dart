import 'package:flutter/material.dart';

class AdvancedHeroAnimation extends StatelessWidget {
  const AdvancedHeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Hero Animation'),),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Using PageRouteBuilder to control the Hero animation duration
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(seconds: 3), // Slowing down the transition
                pageBuilder: (context, animation, secondaryAnimation) =>
                const SecondScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          },
          child: Hero(
            tag: 'hero',
            flightShuttleBuilder: (flightContext, animation, direction,
                formContext, toContext) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (context, _) {
                    final scale = Tween<double>(begin: 1, end: 1.5)
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .evaluate(animation);
                    final rotation = Tween<double>(begin: 0, end: 1 * 3.14)
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .evaluate(animation);
                    return Transform.scale(
                      scale: scale,
                      child: Transform.rotate(angle: rotation,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Tween<double>(begin: 0, end: 50)
                                .evaluate(animation),
                          ),
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.blue,
                          ),
                        ),),
                    );
                  });
            }, child:  Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(child: Text(
                  'Tap me...',
                  style: TextStyle(color: Colors.white),
                ),),
              ),
          ),
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Hero(
          tag: 'hero',
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: const Center(
              child: Text(
                'Landed!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}