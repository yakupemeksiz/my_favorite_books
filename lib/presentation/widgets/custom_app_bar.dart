import 'package:flutter/material.dart';
import 'package:my_favorite_books/core/utils/extensions/context_extensions.dart';

final class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  const CustomAppBar({
    required this.title,
    this.trailing,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) leading!,
        Expanded(
          child: Text(
            title,
            style: context.textTheme.headlineMedium,
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
