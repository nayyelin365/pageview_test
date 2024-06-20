import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('PageView Fast Scroll & Animation Example')),
        body: CustomPageView(),
      ),
    );
  }
}

class CustomPageView extends StatefulWidget {
  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int _currentPage = 0;
  late PageController _pageController;
  int t = 0; // Tid
  late double p; // Position
  bool _isTransitioning = false;
  double _currentPageValue = 0.0;

  @override
  initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.85,
      initialPage: 5,
    );
    _currentPage = 5;
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Listener(
        onPointerMove: (pos) {
          if (_isTransitioning) return;
          // Get pointer position when pointer moves
          // If time since last scroll is undefined or over 100 milliseconds
          if (t == 0 || DateTime.now().millisecondsSinceEpoch - t > 100) {
            t = DateTime.now().millisecondsSinceEpoch;
            p = pos.position.dx; // x position
          } else {
            // Calculate velocity
            double v = (p - pos.position.dx) /
                (DateTime.now().millisecondsSinceEpoch - t);
            if (v < -2 || v > 2) {
              _isTransitioning = true;
              _currentPage = _currentPage +
                  (v * 0.8)
                      .round(); // _currentPage + (v * 1.2).round(); more rapidly for the same swipe speed.
              _pageController
                  .animateToPage(_currentPage,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic)
                  .then((_) {
                _isTransitioning =
                    false; // Reset the flag after animation completes
              });
            }
          }
        },
        child: PageView.builder(
          controller: _pageController,
          physics:
              const ClampingScrollPhysics(), // Will scroll too far with BouncingScrollPhysics
          scrollDirection: Axis.horizontal,
          onPageChanged: (page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemCount: 30,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = _currentPageValue - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.78, 1.0);
                double scaleFactor = Curves.easeOut.transform(value);

                return Center(
                  child: Transform.scale(
                    scale: scaleFactor,
                    child: Opacity(
                      opacity: scaleFactor,
                      child: child,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Page $index',
                    style: const TextStyle(fontSize: 32, color: Colors.white),
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
