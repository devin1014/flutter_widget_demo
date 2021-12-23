import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/list_view/scrollable_positioned_list.dart';
import 'package:flutter_widget_demo/router/router_demo.dart';
import 'package:flutter_widget_demo/routers.dart';

void main() {
  Routers.init();
  Routers.setGlobalPrams({'globalKey1': 'globalValue1'});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const pages = [RouterDemo(), ScrollablePositionedListExample()];
  static const colors = [Colors.greenAccent, Colors.blueGrey, Colors.redAccent, Colors.amberAccent];

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, _, __) {
              final index = settings.arguments as int? ?? 0;
              return pages[index];
            });
      },
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Demo")),
        body: GridView.builder(
            itemCount: pages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => Builder(builder: (context) {
                  final name = pages[index].runtimeType.toString();
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(name, arguments: index);
                      },
                      child: Container(
                        height: 128,
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.center,
                        color: colors[index % colors.length],
                        child: Text(name, style: const TextStyle(fontSize: 14)),
                      ));
                })),
      ),
    );
  }
}
