import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_fill_transition}
/// A Transition that fills the screen.
/// {@endtemplate}
class NesFillTransition extends NesOverlayTransitionWidget {
  /// {@macro nes_fill_transition}
  const NesFillTransition({
    super.key,
    required super.animation,
    required super.child,
  });

  /// Creates a route with this animation.
  static PageRouteBuilder<T> route<T>({
    required RoutePageBuilder pageBuilder,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: pageBuilder,
      reverseTransitionDuration: const Duration(milliseconds: 750),
      transitionDuration: const Duration(milliseconds: 750),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return NesFillTransition(
          animation: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget buildOverlay(BuildContext context, double value) {
    final overlayTransitionTheme =
        context.nesThemeExtension<NesOverlayTransitionTheme>();

    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          width: size.width * value,
          height: size.height * value,
          child: ColoredBox(color: overlayTransitionTheme.color),
        ),
      ],
    );
  }
}
