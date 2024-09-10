import 'package:flutter/material.dart';

class DraggableAnimationDemo extends StatefulWidget {
  const DraggableAnimationDemo({super.key});

  @override
  State<DraggableAnimationDemo> createState() => _DraggableAnimationDemoState();
}

class _DraggableAnimationDemoState extends State<DraggableAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  Offset _offset = Offset.zero;
  Offset _startPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {
          _offset = _startPosition + _animation.value;
        });
      });
  }

  void _onDragEnd() {
    _controller.reset();
    _startPosition = _offset;
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: _offset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Animation Demo')),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _offset += details.delta;
            });
          },
          onPanEnd: (details) {
            _onDragEnd();
          },
          child: Stack(
            children: [
              AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _offset,
                      child: child,
                    );
                  },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:  BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
