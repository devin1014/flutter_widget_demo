import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  bool showToTopBtn = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Demo")),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 50,
          itemExtent: 50,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return Center(
              child: Text(index.toString()),
            );
          },
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.ease);
              }),
    );
  }
}

// --------------------------------------------------------
// ---- Notification
// --------------------------------------------------------
class ListViewNotificationPage extends StatefulWidget {
  const ListViewNotificationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListViewNotificationPageState();
}

class _ListViewNotificationPageState extends State<ListViewNotificationPage> {
  String _process = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Notification Demo")),
        body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
              setState(() {
                _process = "${(progress * 100).toInt()}%";
              });
              print("BottomEdge: ${notification.metrics.extentAfter == 0}");
              return false;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListView.builder(
                    itemCount: 50,
                    itemExtent: 50,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("$index"),
                      );
                    }),
                CircleAvatar(
                  radius: 30,
                  child: Text(_process),
                  backgroundColor: Colors.black45,
                )
              ],
            ),
          ),
        ));
  }
}
