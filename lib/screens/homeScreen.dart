import 'package:flutter/material.dart';

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Explicit Animation Example'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.only(left: _animation.value),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.forward();
              }
            },
            child: Text(_controller.isAnimating ? 'Stop' : 'Start'),
          ),
        ],
      ),
    ),
  );
}
