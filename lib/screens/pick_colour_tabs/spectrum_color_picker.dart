import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SpectrumColorPicker extends StatefulWidget {
  final Color currentColor;
  final ValueChanged<Color> onColorChanged;

  const SpectrumColorPicker({
    super.key,
    required this.currentColor,
    required this.onColorChanged,
  });

  @override
  State<SpectrumColorPicker> createState() => _SpectrumColorPickerState();
}

class _SpectrumColorPickerState extends State<SpectrumColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ColorPicker(
          pickerColor: widget.currentColor,
          onColorChanged: widget.onColorChanged,
          labelTypes: const [],
          pickerAreaHeightPercent: 0.8,
          enableAlpha: true,
          displayThumbColor: true,
        ),
      ),
    );
  }
}
