// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/routers.dart';

const routerPathA = "/pageA";
const routerPathB = "/pageB";
const routerPathC = "/pageC";

abstract class BaseRouterPage extends StatefulWidget {
  const BaseRouterPage({Key? key, required this.params}) : super(key: key);

  final dynamic params;

  @override
  State<BaseRouterPage> createState() => _BaseRouterPageState();
}

class _BaseRouterPageState extends State<BaseRouterPage> {
  late String name;
  bool _postParams = false;
  bool _resultParams = false;

  @override
  void initState() {
    name = widget.runtimeType.toString();
    print("$name initState. params:${widget.params}");
    super.initState();
  }

  @override
  void dispose() {
    print("$name dispose.");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("$name didChangeDependencies.");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant BaseRouterPage oldWidget) {
    print("$name didUpdateWidget.");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("$name deactivate.");
    super.deactivate();
  }

  @override
  void activate() {
    print("$name activate.");
    super.activate();
  }

  @override
  void reassemble() {
    print("$name reassemble.");
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    print("$name build");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.runtimeType.toString())),
        body: WillPopScope(
          onWillPop: () async {
            //TODO:
            Routers.pop(context, {'result': 'success'});
            return true;
          },
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        TextButton(
          onPressed: () => route2Page(context, routerPathA),
          child: const Text("to PageA"),
        ),
        TextButton(
          onPressed: () => route2Page(context, routerPathB),
          child: const Text("to PageB"),
        ),
        TextButton(
          onPressed: () => route2Page(context, routerPathC),
          child: const Text("to PageC"),
        ),
        SizedBox(
            height: 64,
            child: Row(children: [
              const Text("传递参数:{key1:value1}"),
              Checkbox(
                  value: _postParams,
                  onChanged: (bool? value) {
                    setState(() => _postParams = value!);
                  })
            ])),
        SizedBox(
            height: 64,
            child: Row(children: [
              const Text("返回结果:{result:success}"),
              Checkbox(
                  value: _resultParams,
                  onChanged: (bool? value) {
                    setState(() => _resultParams = value!);
                  })
            ])),
        Container(height: 2, color: Colors.grey),
      ],
    );
  }

  void route2Page(BuildContext context, String path) {
    final params = _postParams ? {'a1': 'b1'} : null;
    Routers.navigateTo(
      context,
      path,
      params: params,
      transitionDuration: const Duration(milliseconds: 700),
      replace: false,
    ).then((result) {
      print("result: $result");
    }).catchError((error) {
      print("error: $error");
    });
  }
}

class RouterDemo extends BaseRouterPage {
  const RouterDemo({Key? key, dynamic params}) : super(key: key, params: params);
}

class RouterPageA extends BaseRouterPage {
  const RouterPageA({Key? key, dynamic params}) : super(key: key, params: params);
}

class RouterPageB extends BaseRouterPage {
  const RouterPageB({Key? key, dynamic params}) : super(key: key, params: params);
}

class RouterPageC extends BaseRouterPage {
  const RouterPageC({Key? key, dynamic params}) : super(key: key, params: params);
}
