import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade200,
      height: double.infinity,
      child: Stack(
        children: [
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              width: double.infinity,
              height: 300,
              child: Text(
                '${_event?.localPosition ?? ''}',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            onPointerUp: (event) => setState(() {
              _event = event;
            }),
            onPointerDown: (event) => setState(() {
              _event = event;
            }),
            onPointerMove: (event) => setState(() {
              _event = event;
            }),
          ),
          Positioned(
              left: _event?.localPosition.dx,
              top: _event?.localPosition.dy,
              child: const CircleAvatar(
                child: Text("X"),
              ))
        ],
      ),
    );
  }
}

class GestureRecognizerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GestureRecognizerState();
}

class _GestureRecognizerState extends State<GestureRecognizerPage> {
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        const TextSpan(text: "Hello,"),
        TextSpan(
            text: "World!",
            style: TextStyle(fontSize: 30, color: _toggle ? Colors.blue : Colors.redAccent),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }),
        const TextSpan(text: "....")
      ])),
    );
  }
}
