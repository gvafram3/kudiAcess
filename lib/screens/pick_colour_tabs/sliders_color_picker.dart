import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SlidersColorPicker extends StatefulWidget {
  final Color currentColor;
  final ValueChanged<Color> onColorChanged;

  const SlidersColorPicker({
    super.key,
    required this.currentColor,
    required this.onColorChanged,
  });

  @override
  State<SlidersColorPicker> createState() => _SlidersColorPickerState();
}

class _SlidersColorPickerState extends State<SlidersColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SlidePicker(
        pickerColor: widget.currentColor,
        onColorChanged: widget.onColorChanged,
        enableAlpha: true,
        labelTypes: const [],
      ),
    );
  }
}
