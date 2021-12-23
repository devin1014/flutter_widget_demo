import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/framework/base_change_notifier_widget.dart';

class CategoryViewModel extends BaseViewModel {}

class CategoryTestPage extends BaseChangeNotifierWidget<CategoryViewModel> {
  const CategoryTestPage({
    Key? key,
    required CategoryViewModel model,
  }) : super(key: key, model: model);

  @override
  void onInitialize(CategoryViewModel model) {
    print("onInit: ${model.state.toString()}");
    Future.delayed(const Duration(seconds: 2), () {
      model.setState(ViewState.success);
      print("setState: ${model.state.toString()}");
    });
  }

  @override
  Widget buildWidget(BuildContext context, CategoryViewModel model, Widget? child) {
    return Column(
      children: [
        Text(model.state.toString()),
        TextButton(
            child: const Text("update"),
            onPressed: () {
              model.setState(ViewState.values[(model.state.index + 1) % 4]);
            })
      ],
    );
  }
}
