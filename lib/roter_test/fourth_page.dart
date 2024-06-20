import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔙page4'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async => context.pushNamed('page5'),
          child: const Text('Open page 2'),
        ),
      ),
    );
  }
}

class FivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page5'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async => context.pushNamed('page4'),
          child: const Text('Open page 2'),
        ),
      ),
    );
  }
}
