import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'pick_colour_tabs/grid_color_picker.dart';
import 'pick_colour_tabs/sliders_color_picker.dart';
import 'pick_colour_tabs/spectrum_color_picker.dart';
import 'pick_colour_tabs/sliders_color_picker.dart';

class PickColorScreen extends StatefulWidget {
  const PickColorScreen({super.key});

  @override
  State<PickColorScreen> createState() => _PickColorScreenState();
}

class _PickColorScreenState extends State<PickColorScreen> {
  Color currentColor = Colors.blue; // Default color

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12, 16.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Select colors for App',
                        style: TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Preferred Color',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: 12),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: currentColor,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 36),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.grey[300],
                      ),
                      child: const TabBar(
                        padding: EdgeInsets.all(3.4),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black54,
                        tabs: [
                          Tab(
                            child: Text(
                              'Grid',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Spectrum',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Sliders',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                Expanded(
                  child: TabBarView(
                    children: [
                      GridColorPicker(
                        currentColor: currentColor,
                        onColorChanged: changeColor,
                      ),
                      SpectrumColorPicker(
                        currentColor: currentColor,
                        onColorChanged: changeColor,
                      ),
                      SlidersColorPicker(
                        currentColor: currentColor,
                        onColorChanged: changeColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
