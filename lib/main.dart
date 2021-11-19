import 'package:flutter/material.dart';

import 'channel/android_native_page.dart';

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
          // body: TagListView(
          //     listView: ListView.builder(
          //         itemCount: 99,
          //         itemExtent: 56,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text("index:$index"),
          //           );
          //         }),x
          //     tagBuilder: (position, totalCount) {
          //       return _getTagWidget(position);
          //     }),
          // body: ScrollablePositionedListExample(),
          body: Center(child: AndroidNativeViewPage()),
        ));
  }

// Widget _getTagWidget(int position) {
//   return DecoratedBox(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey, width: 0.5),
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(8)),
//       ),
//       child: SizedBox(
//           width: 64,
//           height: 64,
//           child: Center(
//             child: Text("$position",
//                 textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontSize: 28)),
//           )));
// }
}
