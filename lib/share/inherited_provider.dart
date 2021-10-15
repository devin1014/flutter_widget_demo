import 'dart:collection';

import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
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

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierProvider({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T data;

  static T of<T>(BuildContext context) {
    // final type=_typeOf<InheritedProvider<T>>();
    return context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()!.data;
  }

  @override
  State<StatefulWidget> createState() => _ChangeNotifierProviderState();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider> {
  void update() {
    setState(() => {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider(data: widget.data, child: widget.child);
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
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Builder(
                  builder: (context) {
                    var cart = ChangeNotifierProvider.of<CartModel>(context);
                    return Text("total: ${cart.totalPrice}");
                  },
                ),
                Builder(
                  builder: (context) {
                    print("build...");
                    return RaisedButton(
                      onPressed: () {
                        ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
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
