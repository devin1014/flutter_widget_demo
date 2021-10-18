import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/touch/gusture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text("Widget Demo")),
            // body: SectionScrollView(
            //   sections: List.generate(18, (index) => ("Title $index")),
            //   titleClickListener: (item) => Fluttertoast.showToast(msg: "click: $item"),
            //   contentClickListener: (item) => Fluttertoast.showToast(msg: "click: $item"),
            // ),
            body: GestureRecognizerPage()));
  }
}
