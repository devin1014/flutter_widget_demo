import 'dart:collection';

import 'package:flutter/material.dart';

class MyInheritedProvider<T> extends InheritedWidget {
  const MyInheritedProvider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class MyChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const MyChangeNotifierProvider({
    Key? key,
    required this.notifier,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T notifier;

  static T of<T>(BuildContext context) {
    // final type=_typeOf<InheritedProvider<T>>();
    return context.dependOnInheritedWidgetOfExactType<MyInheritedProvider<T>>()!.data;
  }

  @override
  State<StatefulWidget> createState() => _ChangeNotifierProviderState();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<MyChangeNotifierProvider> {
  void update() {
    setState(() => {});
  }

  @override
  void didUpdateWidget(covariant MyChangeNotifierProvider<T> oldWidget) {
    if (widget.notifier != oldWidget.notifier) {
      oldWidget.notifier.removeListener(update);
      widget.notifier.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.notifier.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.notifier.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedProvider(data: widget.notifier, child: widget.child);
  }
}

class Item {
  Item(this.price, this.count);

  final double price;
  final int count;
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0, (previousValue, element) => previousValue + element.count * element.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyChangeNotifierProvider<CartModel>(
        notifier: CartModel(),
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Builder(
                  builder: (context) {
                    var cart = MyChangeNotifierProvider.of<CartModel>(context);
                    return Text("total: ${cart.totalPrice}");
                  },
                ),
                Builder(
                  builder: (context) {
                    print("build...");
                    return RaisedButton(
                      onPressed: () {
                        MyChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
                      },
                      child: const Text("Add"),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
