import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_icon_button}
/// A button widget that wraps a [NesIcon] into a pressable button.
/// {@endtemplate}
class NesIconButton extends StatelessWidget {
  /// {@macro nes_icon_button}
  const NesIconButton({
    super.key,
    required this.icon,
    this.onPress,
    this.onPressStart,
    this.onPressEnd,
    this.size,
    this.primaryColor,
    this.secondaryColor,
    this.disabled,
  });

  /// Icon of the button.
  final NesIconData icon;

  /// Called when the button is pressed.
  final VoidCallback? onPress;

  /// Called when the button is pressed.
  final VoidCallback? onPressStart;

  /// Called when pressed has ended.
  final VoidCallback? onPressEnd;

  /// Optional primary color for the icon.
  /// Will use value from the theme if none is provided.
  final Color? primaryColor;

  /// Optional secondary color for the icon.
  /// Will use value from the theme if none is provided.
  final Color? secondaryColor;

  /// An optional size for the icon button.
  final Size? size;

  /// Disable the button
  final bool? disabled;

  bool _isDisabled() =>
      (disabled ?? false) ||
      onPress == null && onPressStart == null && onPressEnd == null;

  @override
  Widget build(BuildContext context) {
    return NesPressable(
      onPress: onPress,
      onPressStart: onPressStart,
      onPressEnd: onPressEnd,
      disabled: _isDisabled(),
      child: Opacity(
        opacity: _isDisabled() ? .2 : 1.0,
        child: NesIcon(
          iconData: icon,
          size: size,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
        ),
      ),
    );
  }
}
