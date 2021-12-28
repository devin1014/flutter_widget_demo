import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/logger.dart';

/// -------------------------------------------------------
/// MyInheritedProvider
/// -------------------------------------------------------
class _MyInheritedWidget<T> extends InheritedWidget {
  const _MyInheritedWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant _MyInheritedWidget<T> oldWidget) {
    Log.info(oldWidget, "updateShouldNotify(old), data:${oldWidget.data.hashCode}");
    Log.info(this, "updateShouldNotify(new), data:${data.hashCode}");
    return true;
  }
}

/// -------------------------------------------------------
/// MyChangeNotifierProvider
/// -------------------------------------------------------
class _MyChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  static T? of<T>(BuildContext context, {bool listen = true}) {
    // final type=_typeOf<InheritedProvider<T>>();
    //TODO: can not use dependOnInheritedWidgetOfExactType<MyInheritedWidget<T>>, return null.
    final _MyInheritedWidget? inheritedWidget;
    if (listen) {
      inheritedWidget = context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget<ChangeNotifier>>();
    } else {
      inheritedWidget = context.getElementForInheritedWidgetOfExactType<_MyInheritedWidget<ChangeNotifier>>()?.widget
          as _MyInheritedWidget<ChangeNotifier>;
    }
    return inheritedWidget?.data as T?;
  }

  const _MyChangeNotifierProvider({
    Key? key,
    required this.notifier,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T notifier;

  @override
  State<StatefulWidget> createState() => _MyChangeNotifierProviderState();
}

class _MyChangeNotifierProviderState<T extends ChangeNotifier> extends State<_MyChangeNotifierProvider<T>> {
  void update() => setState(() => {});

  @override
  void didUpdateWidget(covariant _MyChangeNotifierProvider<T> oldWidget) {
    Log.info(this, "didUpdateWidget");
    if (widget.notifier != oldWidget.notifier) {
      oldWidget.notifier.removeListener(update);
      widget.notifier.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    Log.info(this, "initState");
    widget.notifier.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    Log.info(this, "dispose");
    widget.notifier.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Log.info(this, "build");
    return _MyInheritedWidget<T>(data: widget.notifier, child: widget.child);
  }
}

class _Consumer<T> extends StatelessWidget {
  const _Consumer({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) => builder(context, _MyChangeNotifierProvider.of(context));
}

class _Watcher<T> extends StatelessWidget {
  const _Watcher({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) => builder(context, _MyChangeNotifierProvider.of(context, listen: false));
}

/// -------------------------------------------------------
/// Bean
/// -------------------------------------------------------
class _Item {
  _Item(this.price);

  final double price;

  @override
  String toString() => "Item{price:$price}";
}

class _CartModel extends ChangeNotifier {
  final List<_Item> _items = [];

  UnmodifiableListView<_Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0, (previousValue, element) => previousValue + element.price);

  void add(_Item item) {
    Log.info(this, "add: $item");
    _items.add(item);
    notifyListeners();
  }

  @override
  String toString() => "CartModel(0x${hashCode.toRadixString(16)}){size=${items.length},totalPrice=$totalPrice}";
}

/// -------------------------------------------------------
/// Demo
/// -------------------------------------------------------
class MyProviderDemo extends StatefulWidget {
  const MyProviderDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyProviderDemoState();
}

class _MyProviderDemoState extends State<MyProviderDemo> {
  @override
  void initState() {
    Log.info(this, "initState");
    super.initState();
  }

  @override
  void dispose() {
    Log.info(this, "dispose");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    Log.info(this, "didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Log.info(this, "build");
    return Scaffold(
        appBar: AppBar(title: Text(widget.runtimeType.toString())),
        body: Center(
          child: _MyChangeNotifierProvider<_CartModel>(
            notifier: _CartModel(),
            child: Builder(builder: (context) {
              Log.info(this, "builder...");
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _Consumer<_CartModel>(builder: (context, model) {
                    Log.info(this, "builder1");
                    return Text(
                      "size: ${model?.items.length}\ntotal: ${model?.totalPrice}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  }),
                  _Watcher<_CartModel>(builder: (context, model) {
                    Log.info(this, "builder2");
                    return ElevatedButton(
                      onPressed: () => model?.add(item),
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
                ],
              );
            }),
          ),
        ));
  }

  _Item get item => _Item(Random().nextInt(10).toDouble());
}
