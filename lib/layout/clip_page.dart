import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  const ClipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const image = SizedBox.square(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: Icon(Icons.beach_access),
      ),
      dimension: 60,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clip Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          image,
          ClipOval(
            child: image,
          ),
        ],
      ),
    );
  }
}
