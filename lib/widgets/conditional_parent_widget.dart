import 'package:flutter/widgets.dart';

class ConditionalParentWidget extends StatelessWidget {
  final bool hasParent;
  final Widget child;
  final Widget Function(Widget child) parentBuilder;

  const ConditionalParentWidget({
    super.key,
    required this.hasParent,
    required this.child,
    required this.parentBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (hasParent) {
      return parentBuilder(child);
    }
    return child;
  }
}
