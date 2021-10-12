import 'package:flutter/material.dart';

class DecorationPage extends StatelessWidget {
  const DecorationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Decoration Demo")),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Colors.black, Colors.black45]),
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [BoxShadow(color: Colors.blue, offset: Offset(2.0, 2.0), blurRadius: 4)]),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Text("Button", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
