import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     const SizedBox(height: 40, child: Text("Child1")),
    //     const SizedBox(height: 40, child: Text("Child2")),
    //     Expanded(
    //         child: ListView.builder(
    //             itemCount: 50,
    //             itemExtent: 40,
    //             itemBuilder: (context, index) => SizedBox(
    //                   height: 40,
    //                   child: Text("$index"),
    //                 )))
    //   ],
    // );
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return const <Widget>[
          SliverToBoxAdapter(child: SizedBox(height: 40, child: Center(child: Text("Header1")))),
          SliverToBoxAdapter(child: SizedBox(height: 40, child: Center(child: Text("Header2")))),
          SliverToBoxAdapter(child: SizedBox(height: 40, child: Center(child: Text("Header3")))),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40, child: Center(child: Text("Top1"))),
            const SizedBox(height: 40, child: Center(child: Text("Top2"))),
            const SizedBox(height: 40, child: Center(child: Text("Top3"))),
            ListView.builder(
                itemCount: 5 * 2,
                itemExtent: 40,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                      color: Colors.blueGrey,
                      height: 40,
                      child: Center(child: Text("$index")),
                    )),
            const SizedBox(height: 40, child: Center(child: Text("Bottom1"))),
            const SizedBox(height: 40, child: Center(child: Text("Bottom2"))),
            const SizedBox(height: 40, child: Center(child: Text("Bottom3"))),
          ],
        ),
      ),
    );
    // return CustomScrollView(slivers: [
    //   const SliverToBoxAdapter(child: SizedBox(height: 40, child: Text("Child1"))),
    //   const SliverToBoxAdapter(child: SizedBox(height: 40, child: Text("Child2"))),
    //   SliverFixedExtentList(
    //     itemExtent: 40,
    //     delegate: SliverChildBuilderDelegate(
    //       (context, index) {
    //         return SizedBox(height: 40, child: Text("$index"));
    //       },
    //       childCount: 50,
    //     ),
    //   )
    // ]);
  }
}
