import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyModule with ChangeNotifier {
  MyModule();

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

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$this build...}");
    return ChangeNotifierProvider(
      create: (_) => MyModule(),
      child: Column(
        children: [
          Builder(builder: (context) {
            print("$this Builder1...}");
            MyModule module = Provider.of<MyModule>(context, listen: false);
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
                  context.read<MyModule>().reset();
                },
                child: const Text("Reset"),
              ),
            );
          }),
          Consumer<MyModule>(builder: (context, model, child) {
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
          Consumer<MyModule>(builder: (context, model, child) {
            print("$this Consumer2...}");
            return FlatButton(
              color: Colors.tealAccent,
              onPressed: () => model.incrementNow(),
              child: const Icon(Icons.add),
            );
          })
        ],
      ),
    );
  }
}
