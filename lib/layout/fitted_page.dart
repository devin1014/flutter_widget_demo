import 'package:flutter/material.dart';

import 'layout_logger.dart';

class FittedBoxPage extends StatelessWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rowData = Text("*" * 60);
    final rowData1 = Text("x" * 20);
    final rowData2 = Text("y" * 20);
    final rowData3 = Text("z" * 20);
    return Scaffold(
        appBar: AppBar(title: const Text("FittedBox Demo")),
        body: LayoutLogger(
            tag: "Center",
            child: Center(
              child: Column(
                children: [
                  rowData,
                  FittedBox(
                    child: rowData,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [rowData1, rowData2, rowData3],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  FittedBox(
                    child: Row(
                      children: [rowData1, rowData2, rowData3],
                    ),
                  ),
                ],
              ),
            ),
        )
    );
  }
}
