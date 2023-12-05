import 'package:flutter/material.dart';

/// {@template nes_transition_overlay_widget}
/// Base widget for all of the Nes UI transition animation.
///
/// It splits the progress of the animation into steps, in order
/// to make it easy to compose the animation.
///
/// {@endtemplate}
abstract class NesTransitionOverlayWidget extends StatelessWidget {
  /// {@macro nes_transition_overlay_widget}
  const NesTransitionOverlayWidget({
    required this.animation,
    required this.child,
    super.key,
  });

  /// Animation.
  final Animation<double> animation;

  /// Child.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (animation.value == 1) {
      return child;
    }

    return Stack(
      children: [
        if (animation.value >= .5) Positioned.fill(child: child),
        if (animation.value <= .5)
          Positioned.fill(
            child: buildOverlay(context, animation.value * 2),
          )
        else
          Positioned.fill(
            child: buildOverlay(context, (1 - animation.value) * 2),
          ),
      ],
    );
  }

  /// Returns the widget that will be rendered on top of the screen/child.
  Widget buildOverlay(BuildContext context, double value);
}
