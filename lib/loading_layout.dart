import 'package:flutter/material.dart';

enum Loading {
  loading,
  error,
  response,
}

class LoadingLayout extends StatefulWidget {
  LoadingLayout({
    required this.loading,
    required this.error,
    required this.content,
    Key? key,
  }) : super(key: key);

  final Widget loading;
  final Widget error;
  final Widget content;
  Loading state = Loading.loading;

  @override
  State<StatefulWidget> createState() => _LoadingLayoutState();
}

class _LoadingLayoutState extends State<LoadingLayout> {

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == Loading.loading) {
      return widget.loading;
    } else if (widget.state == Loading.error) {
      return widget.error;
    } else {
      return widget.content;
    }
  }
}
