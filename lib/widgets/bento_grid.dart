import 'package:flutter/material.dart';

class BentoGrid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double spacing;
  final double runSpacing;

  const BentoGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 12,
    this.spacing = 16,
    this.runSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final width = c.maxWidth;
        final isMobile = width < 700;
        final isTablet = width >= 700 && width < 1100;

        final count = isMobile ? 1 : (isTablet ? 2 : crossAxisCount);
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          children: children
              .map(
                (w) => SizedBox(
                  width: isMobile
                      ? width
                      : isTablet
                          ? (width - spacing) / 2
                          : (width - spacing * (count - 1)) / count,
                  child: w,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
