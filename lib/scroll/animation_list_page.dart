import 'package:flutter/material.dart';

class AnimationListPage extends StatefulWidget {
  const AnimationListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimationListPageState();
}

class _AnimationListPageState extends State<AnimationListPage> {
  var data = <String>[];
  int counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (var i = 0; i < counter; i++) {
      data.add("${i + 1}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimationList Demo")),
      body: Stack(
        children: [
          AnimatedList(
              key: globalKey,
              initialItemCount: data.length,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: buildItem(context, index),
                );
              }),
          buildAddBtn(),
        ],
      ),
    );
  }

  Widget buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          data.add('${++counter}');
          globalKey.currentState!.insertItem(data.length - 1);
          print('add $counter');
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }

  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => onDelete(context, index),
      ),
    );
  }

  void onDelete(context, index) {
    setState(() {
      globalKey.currentState!.removeItem(index, (context, animation) {
        print('remove ${data[index]}');
        var item = buildItem(context, index);
        data.removeAt(index);
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: const Interval(0.5, 1.0)),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: item,
          ),
        );
      }, duration: Duration(milliseconds: 250));
    });
  }
}
