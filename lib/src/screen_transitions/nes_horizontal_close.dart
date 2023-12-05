import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_horizontal_close_transition}
/// A Transition that looks like horizontal doors are closing in front
/// of the current screen, opening again with the new one.
/// {@endtemplate}
class NesHorizontalCloseTransition extends NesOverlayTransitionWidget {
  /// {@macro nes_horizontal_close_transition}
  const NesHorizontalCloseTransition({
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
        return NesHorizontalCloseTransition(
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
    final width = MediaQuery.of(context).size.width;
    final half = width / 2;

    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          width: half * value,
          child: ColoredBox(color: overlayTransitionTheme.color),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: width - (half * value),
          child: ColoredBox(color: overlayTransitionTheme.color),
        ),
      ],
    );
  }
}
