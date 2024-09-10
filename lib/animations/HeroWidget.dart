import 'package:flutter/material.dart';

class Herowidget extends StatelessWidget {
  const Herowidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Sample')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          ListTile(
            leading: const Hero(
              tag: 'hero-rectangle',
              child: BoxWidget1(size: Size(50.0, 50.0)),
            ),
            onTap: () => _gotoDetailsPage(context),
            title: const Text( 'Tap on the icon to view hero animation transition.',
            ),
          )
        ],
      ),
    );
  }
  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: const Center(
          child: Hero(
            tag: 'hero-rectangle',
            child: BoxWidget1(size: Size(200.0, 200.0)),
          ),
        ),
      ),
    ));
  }
}

class BoxWidget1 extends StatelessWidget {
  const BoxWidget1({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}

class HeroExample extends StatelessWidget {
   HeroExample({super.key});






  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Sample')),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Hero(
              tag: 'hero-default-tween',
              child: BoxWidget(
                size: const Size(50.0, 50.0),
                color: Colors.red[700]!.withOpacity(0.5),
              ),
            ),
            title: const Text(
              'This red icon will use a default rect tween during the hero flight.',
            ),
          ),
          const SizedBox(height: 10.0),
          ListTile(
            leading: Hero(
              tag: 'hero-custom-tween',
              createRectTween: (Rect? begin, Rect? end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              child: BoxWidget(
                size: const Size(50.0, 50.0),
                color: Colors.blue[700]!.withOpacity(0.5),
              ),
            ),
            title: const Text(
              'This blue icon will use a custom rect tween during the hero flight.',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _gotoDetailsPage(context,h,w),
            child: const Text('Tap to trigger hero flight'),
          ),
        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context,double h,double w) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: 'hero-custom-tween',
                createRectTween: (Rect? begin, Rect? end) {
                  return MaterialRectCenterArcTween(begin: begin, end: end);
                },
                child: BoxWidget(
                  size: Size(w, h),
                  color: Colors.blue[700]!.withOpacity(0.5),
                ),
              ),
              Hero(
                tag: 'hero-default-tween',
                child: BoxWidget(
                  size: Size(w, h),
                  color: Colors.red[700]!.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.size,
    required this.color,
  });

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: color,
    );
  }
}

