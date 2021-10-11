import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("WrapPage"),
        ),
        body: Column(
          children: [
            // Row(
            //   children: [
            //     SizedBox.square(
            //       dimension: 130,
            //       child: Container(
            //         color: Colors.red,
            //       ),
            //     ),
            //     SizedBox.square(
            //       dimension: 130,
            //       child: Container(
            //         color: Colors.yellow,
            //       ),
            //     ),
            //     SizedBox.square(
            //       dimension: 130,
            //       child: Container(
            //         color: Colors.green,
            //       ),
            //     )
            //   ],
            // ),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      SizedBox.square(
                        dimension: 130,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox.square(
                        dimension: 130,
                        child: Container(
                          color: Colors.yellow,
                        ),
                      ),
                      SizedBox.square(
                        dimension: 130,
                        child: Container(
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      SizedBox.square(
                        dimension: 130,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox.square(
                        dimension: 130,
                        child: Container(
                          color: Colors.yellow,
                        ),
                      ),
                      SizedBox.square(
                        dimension: 130,
                        child: Container(
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
