import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/scroll/sliver_persistent_header.dart';

class CustomScrollViewPage extends StatelessWidget {
  const CustomScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("CustomScrollView")), body: _buildCustomScrollView3());
  }

  Widget _buildCustomScrollView1() {
    return CustomScrollView(
      slivers: [_buildSliverList(), _buildSliverList()],
    );
  }

  Widget _buildCustomScrollView2() {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true, delegate: SliverHeaderDelegate(maxHeight: 80, minHeight: 50, child: _buildHeader(1))),
        _buildSliverList(),
        SliverPersistentHeader(
            pinned: true, delegate: SliverHeaderDelegate.fixedHeight(height: 50, child: _buildHeader(2))),
        _buildSliverList(),
      ],
    );
  }

  Widget _buildSliverList() {
    return SliverFixedExtentList(
      itemExtent: 56,
      delegate: SliverChildBuilderDelegate((_, index) => ListTile(title: Text("$index")), childCount: 10),
    );
  }

  Widget _buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }

  Widget _buildHorizontalListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemExtent: 64,
        itemBuilder: (context, index) {
          return ListTile(title: Text("$index"));
        });
  }

  Widget _buildCustomScrollView3() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 200, child: _buildHorizontalListView()),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 200, child: _buildHorizontalListView()),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 200, child: _buildHorizontalListView()),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 200, child: _buildHorizontalListView()),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 200, child: _buildHorizontalListView()),
        )
      ],
    );
  }
}
