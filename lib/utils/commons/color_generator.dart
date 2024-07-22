import 'package:flutter/material.dart';

class ColorPalette {
  final Color primary;
  final Color secondary;
  final Color text;
  final Color icon;

  ColorPalette({
    required this.primary,
    required this.secondary,
    required this.text,
    required this.icon,
  });

  static ColorPalette fromPrimaryColor(Color primaryColor) {
    // Generate other colors based on the primary color
    final HSLColor hslColor = HSLColor.fromColor(primaryColor);
    final HSLColor secondaryColor = hslColor.withHue((hslColor.hue + 180) % 360);
    final Color textColor = (hslColor.lightness > 0.5) ? Colors.black : Colors.white;
    final Color iconColor = textColor.withOpacity(0.7);

    return ColorPalette(
      primary: primaryColor,
      secondary: secondaryColor.toColor(),
      text: textColor,
      icon: iconColor,
    );
  }
}
