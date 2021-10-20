import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagListView extends StatefulWidget {
  const TagListView({
    Key? key,
    required this.listView,
    required this.tagBuilder,
    this.positionLeft,
    this.positionTop,
    this.positionRight,
    this.positionBottom,
  }) : super(key: key);

  final double? positionLeft;
  final double? positionTop;
  final double? positionRight;
  final double? positionBottom;

  final ListView listView;
  final TagWidgetBuilder tagBuilder;

  @override
  State<StatefulWidget> createState() => _TagListViewState();
}

typedef TagWidgetBuilder = Widget Function(int position, int totalSize);

class PositionChangeNotifier extends ChangeNotifier {
  PositionChangeNotifier(this._position, this.totalCount);

  var _position = 0;

  int get position => _position;

  void update(int position, bool scrolling) {
    bool changed = false;
    if (_position != position) {
      _position = position;
      changed = true;
    }

    if (_scrolling != scrolling) {
      _scrolling = scrolling;
      changed = true;
    }

    if (changed) {
      notifyListeners();
    }
  }

  var _scrolling = false;

  bool get scrolling => _scrolling;

  final int totalCount;

  @override
  String toString() {
    return "{position:$_position, totalCount:$totalCount, scrolling:$_scrolling}";
  }
}

class _TagListViewState extends State<TagListView> {
  @override
  Widget build(BuildContext context) {
    print("${this} build...");
    final itemExtent = widget.listView.itemExtent!;
    final itemCount = (widget.listView.childrenDelegate as SliverChildBuilderDelegate).childCount!;
    return ChangeNotifierProvider(
        create: (_) => PositionChangeNotifier(0, itemCount),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Builder(builder: (context) {
              print("${this} Builder1...");
              final notifier = context.read<PositionChangeNotifier>();
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is UserScrollNotification) return false;
                  notifier.update(
                      scrollNotification.metrics.pixels ~/ itemExtent, scrollNotification is! ScrollEndNotification);
                  return false;
                },
                child: Scrollbar(
                  child: widget.listView,
                ),
              );
            }),
            Consumer<PositionChangeNotifier>(
              builder: (context, notifier, child) {
                print("${this} Consumer1...($notifier)");
                return Positioned(
                    left: widget.positionLeft,
                    top: widget.positionTop,
                    right: widget.positionRight,
                    bottom: widget.positionBottom,
                    child: Visibility(
                      visible: notifier.scrolling,
                      child: Center(child: widget.tagBuilder(notifier.position, notifier.totalCount)),
                    ));
              },
            )
          ],
        ));
  }
}
