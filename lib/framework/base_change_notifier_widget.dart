import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class BaseChangeNotifierWidget<T extends ChangeNotifier> extends StatefulWidget {
  const BaseChangeNotifierWidget({
    Key? key,
    required this.model,
    this.child,
  }) : super(key: key);

  final T model;
  final Widget? child;

  Widget buildWidget(BuildContext context, T model, Widget? child);

  void onInitialize(T model) {}

  @override
  State<StatefulWidget> createState() => _BaseChangeNotifierWidgetState();
}

class _BaseChangeNotifierWidgetState<T extends ChangeNotifier> extends State<BaseChangeNotifierWidget<T>> {
  late T model;

  @override
  void initState() {
    model = widget.model;
    widget.onInitialize(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer(
          builder: (context, dynamic, child) {
            return widget.buildWidget(context, model, child);
          },
          child: widget.child,
        ));
  }
}

enum ViewState { loading, success, failure, none }

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.none;

  ViewState get state => _state;

  void setState(ViewState state) {
    if (_state != state) {
      _state = state;
      notifyListeners();
    }
  }
}
