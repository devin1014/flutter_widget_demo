import 'package:flutter/cupertino.dart';

class LayoutLogger<T> extends StatelessWidget {
  const LayoutLogger({Key? key, this.tag, required this.child}) : super(key: key);

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
