import 'package:flutter/cupertino.dart';
// ignore: unnecessary_import
import 'package:flutter/material.dart';

class HeightPicker extends StatelessWidget {
  final double initialHeight;
  final ValueChanged<double> onHeightChanged;
  const HeightPicker({
    super.key,
    required this.initialHeight,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    int selectedIndex = (initialHeight - 30).toInt();
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Height (cm)", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Expanded(
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(initialItem: selectedIndex),
                  itemExtent: 40,
                  magnification: 1.2,
                  useMagnifier: true,
                  onSelectedItemChanged: (int index){
                  onHeightChanged(30 + index.toDouble());
                  },
                  children: List.generate(31, (index){
                    return Center(
                      child: Text(
                          "${30+index}",
                        style: const TextStyle(
                          fontSize: 18
                        ),
                      ),
                    );
                  })
              ),
          ),
        ],
      ),
    );
  }
}
