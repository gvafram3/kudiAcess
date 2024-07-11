import 'package:flutter/material.dart';
import '../../utils/commons/grid_colors.dart';

class GridColorPicker extends StatelessWidget {
  final Color currentColor;
  final ValueChanged<Color> onColorChanged;

  const GridColorPicker({
    super.key,
    required this.currentColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: gridColors.length,
        itemBuilder: (context, index) {
          final color = gridColors[index];
          return GestureDetector(
            onTap: () => onColorChanged(color),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color:
                      currentColor == color ? Colors.black : Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
