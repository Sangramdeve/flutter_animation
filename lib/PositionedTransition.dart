import 'package:flutter/material.dart';

class Positionedtransition extends StatefulWidget {
  const Positionedtransition({super.key});

  @override
  State<Positionedtransition> createState() => _PositionedtransitionState();
}

class _PositionedtransitionState extends State<Positionedtransition> with TickerProviderStateMixin {

  late final AnimationController controller = AnimationController(
    duration:  Duration(seconds: 3),
      vsync: this,
  )..repeat(reverse: true);

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return LayoutBuilder(
        builder: (BuildContext context ,BoxConstraints constraints){
          final Size biggest = constraints.biggest;
          return Stack(
            children: [
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                    Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                    biggest,
                  ),
                  end: RelativeRect.fromSize(
                      Rect.fromLTWH(biggest.width - bigLogo, biggest.height - bigLogo, bigLogo, bigLogo),
                      biggest
                  ),
                ).animate(CurvedAnimation(
                    parent: controller,
                    curve: Curves.bounceOut)),

                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: FlutterLogo(),
                ),
              )
            ],
          );
        }
    );
  }
}
