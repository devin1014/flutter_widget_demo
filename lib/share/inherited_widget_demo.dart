// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/logger.dart';

class _ShareDataWidget extends InheritedWidget {
  static _ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ShareDataWidget>();
    // return context.getElementForInheritedWidgetOfExactType<_ShareDataWidget>()?.widget as _ShareDataWidget?;
  }

  const _ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final int data;

  @override
  bool updateShouldNotify(covariant _ShareDataWidget oldWidget) {
    Log.info(this, "updateShouldNotify: ${oldWidget.data} -> $data");
    return oldWidget.data != data;
  }
}

/// ------------------------------------------------------
/// ConsumerWidget
/// ------------------------------------------------------
class _ConsumerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsumerWidgetState();
}

class _ConsumerWidgetState extends State<_ConsumerWidget> {
  @override
  Widget build(BuildContext context) {
    Log.info(this, "build..");
    return Text(
      _ShareDataWidget.of(context)!.data.toString(),
      style: const TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  @override
  void didChangeDependencies() {
    /// NOTE: 只有在Widget中引用InheritedWidget数据并且updateShouldNotify方法返回true，才会调用这个方法。
    /// NOTE: 只有在Widget中引用InheritedWidget数据并且updateShouldNotify方法返回true，才会调用这个方法。
    /// 执行一些耗时操作，避免在build中执行。
    Log.info(this, "didChangeDependencies...");
    super.didChangeDependencies();
  }
}

/// ------------------------------------------------------
/// InheritedDemo
/// ------------------------------------------------------
class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Log.info(this, "build.");
    return Scaffold(
      appBar: AppBar(title: Text(widget.runtimeType.toString())),
      body: Center(
        child: _ShareDataWidget(
          data: count ~/ 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: _ConsumerWidget(),
              ),
              ElevatedButton(
                onPressed: () => setState(resetData),
                child: const Text("Increment", style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetData() {
    ++count;
    Log.info(widget, "setState => $count");
  }
}
