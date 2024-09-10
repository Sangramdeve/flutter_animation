import 'package:flutter/material.dart';

class Animatedphysicalmodel extends StatefulWidget {
  const Animatedphysicalmodel({super.key});

  @override
  State<Animatedphysicalmodel> createState() => _AnimatedphysicalmodelState();
}

class _AnimatedphysicalmodelState extends State<Animatedphysicalmodel> {
  bool _isElevated = false;

  void _toggleElevation() {
    setState(() {
      _isElevated = !_isElevated; // Toggle elevation state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: Duration(seconds: 1), // Animation duration
              curve: Curves.easeInOut, // Animation curve
              elevation: _isElevated ? 68.0 : 0.0, // Animate elevation
              shape: BoxShape.circle, // Shape of the container
              shadowColor: Colors.green, // Color of the shadow
              color: Colors.green, // Color of the container
              borderRadius: BorderRadius.circular(8.0), // Border radius
              child: SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    'Animated',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Empty space between elements
            ElevatedButton(
              onPressed: _toggleElevation, // Button click handler
              child: Text(_isElevated
                  ? 'Remove Elevation'
                  : 'Add Elevation'), // Button text
            ),
          ],
        ),
      ),
    );
  }
}