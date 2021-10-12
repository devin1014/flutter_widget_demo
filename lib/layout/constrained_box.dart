import 'package:flutter/material.dart';

class ConstrainedBoxPage extends StatelessWidget {
  const ConstrainedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ConstrainedDemo")),
        body: Column(
          children: [
            // ConstrainedBox(
            //   constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 64),
            //   child: UnconstrainedBox(
            //     child: Container(
            //       height: 120,
            //       width: double.infinity,
            //       color: Colors.green,
            //     ),
            //   ),
            // ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 64),
              child: const SizedBox(
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Container(color: Colors.green),
            ),
            LimitedBox(
              maxHeight: 64,
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.blue,
              ),
            ),
            // FractionallySizedBox(
            //   widthFactor: 1,
            //   heightFactor: 1,
            //   child: Container(
            //     color: Colors.black,
            //     width: 100,
            //     height: 100,
            //   ),
            // )
          ],
        ));
  }
}
