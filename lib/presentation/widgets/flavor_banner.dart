import 'package:flutter/material.dart';
import 'package:my_favorite_books/core/config/flavor_config.dart';

final class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    required this.child,
    required this.message,
    super.key,
  });
  final Widget child;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: FlavorConfig.isProd
          ? child
          : Banner(
              message: message,
              location: BannerLocation.topStart,
              color: FlavorConfig.isStage ? Colors.red : Colors.green,
              child: child,
            ),
    );
  }
}
