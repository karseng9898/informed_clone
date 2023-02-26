import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.title,
    this.verticalMargin,
    this.horizontalMargin,
  });

  final String title;
  final double? verticalMargin;
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      endIndent: 10.0,
      thickness: 1,
    );

    final titleLabel = Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: AppColors.secondaryLabelColor),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalMargin ?? 0,
        horizontal: horizontalMargin ?? 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: divider),
          titleLabel,
          const Expanded(child: divider),
        ],
      ),
    );
  }
}
