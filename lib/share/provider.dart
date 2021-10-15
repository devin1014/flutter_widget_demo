import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyModule with ChangeNotifier {
  MyModule({this.count = 0});

  int count = 0;

  Future<void> incrementCountLater() async {
    await Future.delayed(const Duration(seconds: 2));
    count++;
    notifyListeners();
    print(count);
  }

  void incrementCountNow() {
    count++;
    notifyListeners();
    print(count);
  }
}

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyModule(),
      child: Column(
        children: [
          Builder(builder: (context) {
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
          Consumer<MyModule>(builder: (context, model, child) {
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
          Consumer<MyModule>(
            builder: (context, model, child) {
              return FlatButton(
                color: Colors.tealAccent,
                onPressed: () => model.incrementCountNow(),
                child: const Icon(Icons.add),
              );
            },
          )
        ],
      ),
    );
  }
}
