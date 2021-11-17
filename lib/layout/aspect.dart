import 'package:flutter/material.dart';

class AspectPage extends StatelessWidget {
  const AspectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _build4(context);

  Widget _build1(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: double.infinity,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _build2(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 100.0,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Container(
          width: 100.0,
          height: 50.0,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _build3(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 100.0,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: Container(
          width: 100.0,
          height: 50.0,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _build4(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
    );
  }
}
