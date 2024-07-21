import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

final colorProvider = StateNotifierProvider<ColorNotifier, ColorState>((ref) {
  return ColorNotifier();
});

class ColorState {
  final Color baseColor;
  final List<Color> generatedColors;

  ColorState({required this.baseColor, required this.generatedColors});

  Map<String, dynamic> toJson() => {
        'baseColor': baseColor.value,
        'generatedColors': generatedColors.map((color) => color.value).toList(),
      };

  static ColorState fromJson(Map<String, dynamic> json) {
    return ColorState(
      baseColor: Color(json['baseColor']),
      generatedColors: (json['generatedColors'] as List)
          .map((value) => Color(value))
          .toList(),
    );
  }
}

class ColorNotifier extends StateNotifier<ColorState> {
  ColorNotifier()
      : super(ColorState(baseColor: Colors.blue, generatedColors: [
          Colors.blueAccent,
          Colors.lightBlue,
          Colors.lightBlueAccent
        ])) {
    _loadColors();
  }

  void setBaseColor(Color color) {
    final generatedColors = _generateContrastingColors(color);
    state = ColorState(baseColor: color, generatedColors: generatedColors);
    _saveColors();
  }

  List<Color> _generateContrastingColors(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    return [
      hsl.withLightness((hsl.lightness + 0.3) % 1.0).toColor(),
      hsl.withLightness((hsl.lightness + 0.5) % 1.0).toColor(),
      hsl.withLightness((hsl.lightness + 0.7) % 1.0).toColor(),
    ];
  }

  Future<void> _loadColors() async {
    final prefs = await SharedPreferences.getInstance();
    final colorsString = prefs.getString('colors');
    if (colorsString != null) {
      final colorsMap = jsonDecode(colorsString) as Map<String, dynamic>;
      state = ColorState.fromJson(colorsMap);
    }
  }

  Future<void> _saveColors() async {
    final prefs = await SharedPreferences.getInstance();
    final colorsString = jsonEncode(state.toJson());
    await prefs.setString('colors', colorsString);
  }
}
