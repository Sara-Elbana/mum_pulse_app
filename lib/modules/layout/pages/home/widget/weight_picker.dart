import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightPicker extends StatelessWidget {
  final double initialWeight;
  final ValueChanged<double> onWeightChanged;
  const WeightPicker({
    super.key,
    required this.initialWeight,
    required this.onWeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    int selectedIndex = (initialWeight - 2).toInt();
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Weight (kg)", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: selectedIndex),
              itemExtent: 40,
              magnification: 1.2,
              useMagnifier: true,
              onSelectedItemChanged: (int index) {
                onWeightChanged(2 + index.toDouble()); // تحديث الوزن حسب القيمة المختارة
              },
              children: List.generate(11, (index) {
                return Center(
                  child: Text(
                    "${2 + index}",
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
