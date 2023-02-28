import 'package:flutter/material.dart';

import 'conditional_parent_widget.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool block;
  final bool isSubmitting;

  const ActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.block = false,
    this.isSubmitting = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalParentWidget(
      hasParent: block,
      parentBuilder: (child) => FractionallySizedBox(
        widthFactor: 1,
        child: child,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: isSubmitting ? getLoadingIndicator() : getTitleLabel(context),
      ),
    );
  }
}

// * ----------------------- Widget Factories --------------------------------
extension _WidgetFactories on ActionButton {
  Widget getLoadingIndicator() => const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );

  Widget getTitleLabel(BuildContext context) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.white),
      );
}
