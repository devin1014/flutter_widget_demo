import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const methodChannel1 = "com.flutter.demo.MethodChannel1";

class MethodChannelPage extends StatefulWidget {
  const MethodChannelPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  final channel = const MethodChannel(methodChannel1);
  var _responseIndex = "";
  var _responseData = "";

  @override
  void initState() {
    super.initState();
    channel.setMethodCallHandler((call) {
      setState(() {
        _responseIndex = "result: ${call.arguments['result']}";
      });
      return Future.sync(() => null);
    });
    _responseData = "native response";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "MethodChannel",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          _responseIndex,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        TextButton(
          onPressed: () async {
            final arguments = {'a': 1, 'b': 2};
            dynamic result;
            try {
              result = await channel.invokeMethod('hello', arguments);
            } catch (e) {
              result = e.toString();
            }
            setState(() {
              _responseData = "argument: ${arguments.toString()}\n"
                  "result: $result";
            });
          },
          child: const Text("send data to native..."),
        ),
        const SizedBox(height: 12),
        Text(
          _responseData,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ],
    );
  }
}
