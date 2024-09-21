import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatorScreen(),
    );
  }
}

class AnimatorScreen extends StatefulWidget {
  @override
  _AnimatorScreenState createState() => _AnimatorScreenState();
}

class _AnimatorScreenState extends State<AnimatorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animation Example'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          margin: EdgeInsets.only(left: _animation.value),
        ),
      ),
    );
  }
}
