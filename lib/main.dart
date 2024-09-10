import 'package:flutter/material.dart';
import 'package:flutter_animation/animations/HeroAnimationDemo.dart';

import 'Physics-based animation/DraggableAnimationDemo.dart';
import 'Physics-based animation/FrictionAnimationDemo.dart';
import 'Physics-based animation/GravityAnimationDemo.dart';
import 'Physics-based animation/PendulumAnimationDemo.dart';
import 'Physics-based animation/physics_based_animation.dart';
import 'Tween-animation/BezierTweenAnimation.dart';
import 'barrel_files.dart';
import 'Tween-animation/AdvancedHeroAnimation.dart';
import 'Tween-animation/ComplexAnimationDemo .dart';
import 'Tween-animation/MultiTweenAnimationDemo.dart';
import 'Tween-animation/multiple_animations_demo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Icon for the side navigation button
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the side drawer
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Add drawer items for each animation widget
            _buildDrawerItem(context, 'AnimatedAlign', const Animatedalign()),
            _buildDrawerItem(context, 'AnimatedBuilder',  const AnimatedbuilderWidget()),
            _buildDrawerItem(context, 'AnimatedContainer',  const AnimatedcontainerWidget()),
            _buildDrawerItem(context, 'AnimatedCrossFade', const Animatedcrossfade()),
            _buildDrawerItem(context, 'AnimatedDefaultTextStyle', const AnimatedDefaultTextStyleExample()),
            _buildDrawerItem(context, 'AnimatedOpacity', const Animatedopacity()),
            _buildDrawerItem(context, 'AnimatedPhysicalModel', const Animatedphysicalmodel()),
            _buildDrawerItem(context, 'AnimatedPositioned', const Animatedpositioned()),
            _buildDrawerItem(context, 'AnimatedSize', const Animatedsize()),
            _buildDrawerItem(context, 'AnimatedWidget', const Animatedwidget()),
            _buildDrawerItem(context, 'DecoratedBoxTransition', const Decoratedboxtransition()),
            _buildDrawerItem(context, 'FadeTransition', const Fadetransition()),
            _buildDrawerItem(context, 'Hero', const Herowidget()),
            _buildDrawerItem(context, 'HeroAnimationDemo ',   HeroAnimationExample ()),
            _buildDrawerItem(context, 'PositionedTransition', const Positionedtransition()),
            _buildDrawerItem(context, 'RotationTransition', const Rotationtransition()),
            _buildDrawerItem(context, 'ScaleTransition', const Scaletransition()),
            _buildDrawerItem(context, 'SizeTransition', const  Sizetransition()),
            _buildDrawerItem(context, 'SlideTransition', const  Slidetransition()),
            _buildDrawerItem(context, 'BezierTweenAnimation  ',    const BezierTweenAnimation()),
            _buildDrawerItem(context, 'TweenAnimationBuilder', const  MultiTweenAnimationDemo()),
            _buildDrawerItem(context, 'MultipleAnimationsDemo',   const MultipleAnimationsDemo()),
            _buildDrawerItem(context, 'ComplexAnimationDemo ',   ComplexAnimationDemo ()),
            _buildDrawerItem(context, 'AdvancedHeroAnimation ',   const AdvancedHeroAnimation ()),
            _buildDrawerItem(context, 'SpringAnimation ',   const PhysicsBasedAnimationDemo ()),
            _buildDrawerItem(context, 'FrictionAnimationDemo ',    FrictionAnimationDemo ()),
            _buildDrawerItem(context, 'GravityAnimationDemo ',    const GravityAnimationDemo()),
            _buildDrawerItem(context, 'PendulumAnimationDemo  ',    const PendulumAnimationDemo()),
            _buildDrawerItem(context, 'DraggableAnimationDemo  ',    const DraggableAnimationDemo()),

          ],
        ),
      ),
      body: const Center(
        child: Text('Select an animation from the drawer'),
      ),
    );
  }

  // Helper function to create a drawer item
  Widget _buildDrawerItem(BuildContext context, String title, Widget targetWidget) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Close the drawer before navigating
        Navigator.pop(context);
        // Navigate to the animation screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetWidget),
        );
      },
    );
  }
}
