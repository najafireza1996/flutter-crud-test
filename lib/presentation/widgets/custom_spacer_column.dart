import 'package:flutter/material.dart';

class CustomSpacerColumn extends StatelessWidget {
  const CustomSpacerColumn({Key? key, required this.children, required this.space}) : super(key: key);
  final List<Widget> children;
  final double space;
  @override
  Widget build(BuildContext context) {
    final newChildren = <Widget>[];
    for (int i = 0; i < children.length - 1; i++) {
      newChildren.addAll([
        children[i],
        SizedBox(
          height: space,
        )
      ]);
    }
    if (children.isNotEmpty) newChildren.add(children.last);
    return Column(children: newChildren);
  }
}
