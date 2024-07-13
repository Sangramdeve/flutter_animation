import 'package:flutter/material.dart';

import 'AnimatedAlign.dart';
import 'AnimatedBuilder.dart';
import 'AnimatedContainer.dart';
import 'AnimatedCrossFade.dart';
import 'AnimatedDefaultTextStyle.dart';
import 'AnimatedOpacity.dart';
import 'AnimatedPhysicalModel.dart';
import 'AnimatedPositioned.dart';
import 'AnimatedSize.dart';
import 'AnimatedWidget.dart';
import 'DecoratedBoxTransition.dart';
import 'FadeTransition.dart';
import 'HeroWidget.dart';
import 'PositionedTransition.dart';
import 'RotationTransition.dart';
import 'ScaleTransition.dart';
import 'SizeTransition.dart';
import 'SlideTransition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      //const Animatedalign(),
      //const Animatedbuilder(),
      //const Animatedcontainer(),
      //const Animatedcrossfade(),
      //const AnimatedDefaultTextStyleExample(),
      //const Animatedopacity(),
      // const Animatedphysicalmodel(),
      //const Animatedpositioned(),
      //const Animatedsize(),
      //const Animatedwidget(),
      //const Decoratedboxtransition(),
      //const Fadetransition(),
      //const Herowidget(),
      //const Positionedtransition(),
      //const Rotationtransition(),
      //const Scaletransition(),
      //const Sizetransition(),
      const Slidetransition(),
    );
  }
}


