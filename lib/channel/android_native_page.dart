import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _methodChannel = "plugins.flutter.io/my_flutter_view.method_channel";

class AndroidNativeViewPage extends StatefulWidget {
  const AndroidNativeViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AndroidNativeViewState();
}

class _AndroidNativeViewState extends State<AndroidNativeViewPage> {
  final _channels = <MethodChannel>[];

  @override
  Widget build(BuildContext context) {
    Widget platformView() {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return AndroidView(
          viewType: "plugins.flutter.io/my_flutter_view",
          creationParams: const {'text': 'hello'},
          creationParamsCodec: const StandardMessageCodec(),
          onPlatformViewCreated: (viewId) {
            print("onPlatformViewCreated: $viewId");
            _channels.add(MethodChannel(_methodChannel + viewId.toString()));
            print("add channel: ${_methodChannel + viewId.toString()}");
          },
        );
      } else {
        return const Text("flutter Text...");
      }
    }

    var index = 100;

    return Column(
      children: [
        Container(
          height: 90,
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () async {
              for (var c in _channels) {
                try {
                  await c.invokeMethod("setText", {'text': index.toString()});
                } catch (e) {
                  print(e);
                }
                index++;
              }
            },
            child: const Text("send data. 666"),
          ),
        ),
        Container(
          height: 90,
          alignment: Alignment.centerLeft,
          color: Colors.redAccent,
          child: platformView(),
        ),
        Container(
          height: 90,
          alignment: Alignment.centerLeft,
          color: Colors.yellowAccent,
          child: platformView(),
        ),
        Container(
          height: 90,
          alignment: Alignment.centerLeft,
          color: Colors.greenAccent,
          child: platformView(),
        )
      ],
    );
  }
}
