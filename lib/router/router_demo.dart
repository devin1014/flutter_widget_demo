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

class _BaseRouterPageState extends State<BaseRouterPage> with WidgetsBindingObserver {
  late String name;
  bool _postParams = false;
  bool _resultParams = false;
  final _transferParam = {'key1': 'value1'};
  final _transferResult = {'code': 'success'};

  @override
  void initState() {
    name = widget.runtimeType.toString();
    print("$name -> initState. params:${widget.params}");
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    print("$name -> dispose.");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("$name -> didChangeDependencies.");
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("$name -> didChangeAppLifecycleState: $state");
  }

  @override
  void didUpdateWidget(covariant BaseRouterPage oldWidget) {
    print("$name -> didUpdateWidget.");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("$name -> deactivate.");
    super.deactivate();
  }

  @override
  void activate() {
    print("$name -> activate.");
    super.activate();
  }

  @override
  void reassemble() {
    print("$name -> reassemble.");
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    print("$name -> build");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.runtimeType.toString()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Routers.pop(context, _resultParams ? _transferResult : null);
            },
          ),
        ),
        body: WillPopScope(
          onWillPop: () {
            //TODO: router不同, 无法获得返回参数
            //TODO: router不同, 无法获得返回参数
            Routers.pop(context, _resultParams ? _transferResult : null);
            return Future.value(false);
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
              Text("传递参数: ${_transferParam.toString()}"),
              Checkbox(
                  value: _postParams,
                  onChanged: (bool? value) {
                    setState(() => _postParams = value!);
                  })
            ])),
        SizedBox(
            height: 64,
            child: Row(children: [
              Text("返回结果: ${_transferResult.toString()}"),
              Checkbox(
                  value: _resultParams,
                  onChanged: (bool? value) {
                    setState(() => _resultParams = value!);
                  })
            ])),
        Container(height: 2, color: Colors.grey),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(widget.params.toString(), style: const TextStyle(fontSize: 18)),
        )
      ],
    );
  }

  void route2Page(BuildContext context, String path) async {
    await Routers.navigateTo(
      context,
      path,
      params: _postParams ? _transferParam : null,
      transitionDuration: const Duration(milliseconds: 700),
      replace: false,
    ).then((result) {
      print("$name -> result: $result");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("返回结果: $result")),
      // );
    }).catchError((error) {
      print("$name -> error:  $error");
    });
  }
}

class RouterDemo extends BaseRouterPage {
  const RouterDemo({Key? key}) : super(key: key, params: null);
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
