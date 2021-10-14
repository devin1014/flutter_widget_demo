import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("PageView Demo")),
        // body: PageView(
        //   allowImplicitScrolling: true,
        //   children: const [
        //     MyPage(1),
        //     MyPage(2),
        //     MyPage(3),
        //     MyPage(4),
        //     MyPage(5),
        //   ],
        // ),
        body: PageView.builder(itemCount: 5, itemBuilder: (context, index) => MyPage(index)));
  }
}

class MyPage extends StatefulWidget {
  const MyPage(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("build ${widget.index}");
    return Center(
      child: Text(
        "${widget.index}",
        textScaleFactor: 5,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// ------------------------------------------------------
// ---- TabView
// ------------------------------------------------------
class TabViewPage extends StatefulWidget {
  const TabViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TabViewPage Demo"),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
                alignment: Alignment.center,
                child: Text(
                  e,
                  textScaleFactor: 5,
                ));
          }).toList(),
        ));
  }
}

class TabViewPage2 extends StatelessWidget {
  const TabViewPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tabs = ["新闻", "历史", "图片"];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("TabViewPage2 Demo"),
              bottom: TabBar(
                  tabs: tabs
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList())),
          body: TabBarView(
            children: tabs
                .map((e) => Container(
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        textScaleFactor: 5,
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}
