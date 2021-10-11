import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack Demo")),
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.loose,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Container(
                color: Colors.green,
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: const Text(
              "666",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const Positioned(
              bottom: 6,
              left: 12,
              child: Text(
                "Title",
                style: TextStyle(fontSize: 24, color: Colors.black),
              )),
          const Positioned(
              bottom: 6,
              right: 12,
              child: Text(
                "description",
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
        ],
      ),
    );
  }
}
