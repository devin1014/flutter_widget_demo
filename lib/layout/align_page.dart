import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Align Demo")),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child: Stack(
              children: [
                SizedBox(width: 120, height: 120, child: Container(color: Colors.purple.shade200)),
                const Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
                const Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(2, 2),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("AAA"),
                    ),
                  ),
                )
              ],
            )));
  }
}
