import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/layout/fitted_page.dart';

import 'layout/align_page.dart';
import 'layout/clip_page.dart';
import 'layout/constrained_box.dart';
import 'layout/decoration_page.dart';
import 'layout/flex_page.dart';
import 'layout/layout_builder.dart';
import 'layout/stack_page.dart';
import 'layout/wrap_page.dart';

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
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const FittedBoxPage(),
    );
  }
}
