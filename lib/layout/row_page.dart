import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Row Demo"),
      ),
      body: _RowCrossAxisAlignment(),
    );
  }
}

class _RowMainAxisAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("mainAxisAlignment:start"),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: _buildSizedBoxRow(sizes: squares)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("mainAxisAlignment:center"),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: _buildSizedBoxRow(sizes: squares)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("mainAxisAlignment:end"),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: _buildSizedBoxRow(sizes: squares)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("mainAxisAlignment:spaceBetween"),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: _buildSizedBoxRow(sizes: squares)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("mainAxisAlignment:spaceAround"),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: _buildSizedBoxRow(sizes: squares)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("mainAxisAlignment:spaceEvenly"),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _buildSizedBoxRow(sizes: squares)),
      ],
    );
  }
}

class _RowCrossAxisAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("crossAxisAlignment:start"),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: _buildSizedBoxRow(sizes: rectangles)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("crossAxisAlignment:center"),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: _buildSizedBoxRow(sizes: rectangles)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("crossAxisAlignment:end"),
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: _buildSizedBoxRow(sizes: rectangles)),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text("crossAxisAlignment:baseline"),
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: _buildTextRow()),
        //note:
        // const Padding(
        //   padding: EdgeInsets.all(6),
        //   child: Text("crossAxisAlignment:stretch"),
        // ),
        // Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: const [Spacer()]),
      ],
    );
  }
}

const double _boxSize = 48;
const List<Size> squares = [Size(_boxSize, _boxSize), Size(_boxSize, _boxSize), Size(_boxSize, _boxSize)];
const List<Size> rectangles = [
  Size(_boxSize, _boxSize * 1.1),
  Size(_boxSize, _boxSize * 1.3),
  Size(_boxSize, _boxSize * 1.5)
];

List<Widget> _buildSizedBoxRow({required List<Size> sizes}) {
  return [
    SizedBox(
      width: sizes[0].width,
      height: sizes[0].height,
      child: Container(
        color: Colors.red,
      ),
    ),
    SizedBox(
      width: sizes[1].width,
      height: sizes[1].height,
      child: Container(
        color: Colors.yellow,
      ),
    ),
    SizedBox(
      width: sizes[2].width,
      height: sizes[2].height,
      child: Container(
        color: Colors.green,
      ),
    )
  ];
}

List<Widget> _buildTextRow() {
  return [
    const Text(
      "AAA",
      style: TextStyle(fontSize: 20, color: Colors.red, decoration: TextDecoration.underline),
    ),
    const Text(
      "BBB",
      style: TextStyle(fontSize: 25, color: Colors.yellow, decoration: TextDecoration.underline),
    ),
    const Text(
      "CCC",
      style: TextStyle(fontSize: 30, color: Colors.green, decoration: TextDecoration.underline),
    )
  ];
}
