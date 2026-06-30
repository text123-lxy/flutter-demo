import 'package:flutter/material.dart';

class CustomWrapGrid extends StatelessWidget {
  // 子组件列表
  final List<Widget> children;
  // 卡片固定宽度
  final double itemWidth;
  // 行列间距
  final double spacing;

  const CustomWrapGrid({
    super.key,
    required this.children,
    required this.itemWidth,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: WrapAlignment.start,
      children: children
          .map(
            (child) => SizedBox(
              width: itemWidth,
              child: child,
            ),
          )
          .toList(),
    );
  }
}