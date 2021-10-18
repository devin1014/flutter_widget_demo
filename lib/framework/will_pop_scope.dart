import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WillPopScopePage extends StatelessWidget {
  WillPopScopePage({Key? key}) : super(key: key);

  DateTime? _lastTryExit;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text("Exit"),
          ),
        ),
        onWillPop: () async {
          if (_lastTryExit == null || DateTime.now().difference(_lastTryExit!) > const Duration(seconds: 1)) {
            Fluttertoast.showToast(msg: "exit???");
            _lastTryExit = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
