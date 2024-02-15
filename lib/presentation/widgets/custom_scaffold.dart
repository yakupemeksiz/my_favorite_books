import 'package:fancy_dio_inspector/fancy_dio_inspector.dart';
import 'package:flutter/material.dart';
import 'package:my_favorite_books/core/utils/extensions/context_extensions.dart';

final class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({
    required this.body,
    super.key,
  });

  void _onTap(BuildContext context) {
    final focusScope = FocusScope.of(context);

    if (focusScope.hasFocus) {
      focusScope.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _onTap(context),
      child: Scaffold(
        body: body,
        endDrawer: SizedBox(
          width: context.width * 0.8,
          child: const FancyDioInspectorView(),
        ),
      ),
    );
  }
}
