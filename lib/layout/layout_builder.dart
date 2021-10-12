import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, const Text("A"));
    return Scaffold(
      appBar: AppBar(title: const Text("LayoutBuilder Demo")),
      body: Column(
        children: [
          SizedBox(
            width: 190,
            child: _ResponsiveColumn(
              children: _children,
            ),
          ),
          _ResponsiveColumn(children: _children),
          const _LayoutLogPrint(child: Text("xx"))
        ],
      ),
    );
  }
}

class _ResponsiveColumn extends StatelessWidget {
  const _ResponsiveColumn({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          return Column(
            children: children,
            mainAxisSize: MainAxisSize.min,
          );
        } else {
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i++) {
            if (i + 1 < children.length) {
              _children.add(Row(
                children: [children[i], children[i + 1]],
                mainAxisSize: MainAxisSize.min,
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(
            children: _children,
            mainAxisSize: MainAxisSize.min,
          );
        }
      },
    );
  }
}

class _LayoutLogPrint<T> extends StatelessWidget {
  const _LayoutLogPrint({Key? key, this.tag, required this.child}) : super(key: key);

  final Widget child;
  final T? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        assert(() {
          print('${tag ?? key ?? child}: $constraints');
          return true;
        }());
        return child;
      },
    );
  }
}
