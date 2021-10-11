import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flex Demo")),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 96,
                  color: Colors.red,
                  child: const Text("flex:1"),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    height: 96,
                    color: Colors.yellow,
                    child: const Text("flex:2"), 
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 96,
                  color: Colors.green,
                  child: const Text("flex:3"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
