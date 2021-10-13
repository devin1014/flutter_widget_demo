import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(title: const Text("SingleChildScrollView")),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((e) => Text(
                        e,
                        textScaleFactor: 2.0,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
