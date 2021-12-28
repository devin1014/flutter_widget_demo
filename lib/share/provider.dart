// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _MyModule with ChangeNotifier {
  _MyModule();

  int _count = 0;

  int get count => _count;

  void reset() {
    _count = 0;
    print(_count);
    notifyListeners();
  }

  void incrementNow() {
    _count++;
    print(_count);
    notifyListeners();
  }

  Future<void> incrementAsync({int seconds = 1}) async {
    await Future.delayed(Duration(seconds: seconds));
    _count++;
    print(_count);
    notifyListeners();
  }
}

class ChangeNotifierProviderDemo extends StatelessWidget {
  const ChangeNotifierProviderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$this build...}");
    return Scaffold(
      appBar: AppBar(title: Text(runtimeType.toString())),
      body: ChangeNotifierProvider(
        create: (_) => _MyModule(),
        child: Column(
          children: [
            Builder(builder: (context) {
              print("$this Builder1...}");
              _MyModule module = Provider.of<_MyModule>(context, listen: false);
              return Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                color: Colors.lightBlueAccent,
                child: Text("initValue: ${module.count}"),
              );
            }),
            Builder(builder: (context) {
              print("$this Builder2...}");
              return Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                color: Colors.redAccent,
                child: FlatButton(
                  onPressed: () {
                    context.read<_MyModule>().reset();
                  },
                  child: const Text("Reset"),
                ),
              );
            }),
            Consumer<_MyModule>(builder: (context, model, ch) {
              print("$this Consumer1...}");
              return Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                color: Colors.lightGreen,
                child: Text(
                  'Current: ${model.count}',
                ),
              );
            }),
            Consumer<_MyModule>(builder: (context, model, child) {
              print("$this Consumer2...}");
              return FlatButton(
                color: Colors.tealAccent,
                onPressed: () => model.incrementNow(),
                child: const Icon(Icons.add),
              );
            })
          ],
        ),
      ),
    );
  }
}
