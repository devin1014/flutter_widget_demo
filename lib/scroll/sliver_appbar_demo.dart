import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  const SliverAppBarDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("SliverAppBar Demo"),
            floating: true,
            pinned: false,
          ),
          SliverFixedExtentList(
            itemExtent: 64,
            delegate:
                SliverChildBuilderDelegate((context, index) => Center(child: Text(index.toString())), childCount: 30),
          ),
        ],
      ),
    );
  }
}
