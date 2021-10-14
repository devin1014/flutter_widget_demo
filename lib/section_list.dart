import 'package:flutter/material.dart';

// ------------------------------------------------------------------------------------
// ---- AbstractSectionListView
// ------------------------------------------------------------------------------------
typedef SectionTitleBuilder<T> = Widget Function(T section);
typedef SectionContentBuilder<T> = Widget Function(T section);
typedef ClickListener<T> = void Function(T t);

abstract class AbstractSectionScrollView<T> extends StatelessWidget {
  const AbstractSectionScrollView({
    required this.sections,
    required this.titleBuilder,
    required this.contentBuilder,
    Key? key,
  }) : super(key: key);

  final List<T> sections;
  final SectionTitleBuilder titleBuilder;
  final SectionContentBuilder contentBuilder;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _buildSectionSlivers(sections));
  }

  List<Widget> _buildSectionSlivers(List<T> list) {
    return list.map((e) => SliverToBoxAdapter(child: Column(children: [titleBuilder(e), contentBuilder(e)]))).toList();
  }
}

// ------------------------------------------------------------------------------------
// ---- SectionScrollView
// ------------------------------------------------------------------------------------
class SectionScrollView<T> extends StatelessWidget {
  const SectionScrollView({
    required this.sections,
    required this.titleClickListener,
    required this.contentClickListener,
    Key? key,
  }) : super(key: key);

  final List<T> sections;
  final ClickListener? titleClickListener;
  final ClickListener? contentClickListener;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _buildSectionSlivers(sections));
  }

  List<Widget> _buildSectionSlivers(List<T> list) {
    return list
        .map((e) => SliverToBoxAdapter(
            child: Column(
                children: [_buildSectionTitle(e, titleClickListener), _buildSectionContent(e, contentClickListener)])))
        .toList();
  }

  Widget _buildSectionTitle(T title, ClickListener? clickListener) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: Text(title.toString(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          TextButton(
            onPressed: () => clickListener != null ? clickListener(title) : null,
            child: const Text("More"),
          )
        ],
      ),
    );
  }

  Widget _buildSectionContent(T t, ClickListener? clickListener) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => clickListener != null ? clickListener("item$index") : null,
            child: Image.asset("images/image_1.jpg"),
          );
        },
        separatorBuilder: (context, index) => const VerticalDivider(width: 12, color: Colors.transparent),
      ),
    );
  }
}
