import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/route/route_name.dart';
import 'package:flutter_animation/barrel_files.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings setting){
    switch(setting.name){
      case RoutesName.animatedAlign:
        return MaterialPageRoute(builder: (context) => const Animatedalign());
      case RoutesName.animatedBuilder:
        return MaterialPageRoute(builder: (context) => const AnimatedbuilderWidget());
      case RoutesName.animatedContainer:
        return MaterialPageRoute(builder: (context) => const AnimatedcontainerWidget());
      case RoutesName.animatedCrossFade:
        return MaterialPageRoute(builder: (context) => const Animatedcrossfade());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
                child: Text('no route Generated')),
          );
        });
    }
  }
}