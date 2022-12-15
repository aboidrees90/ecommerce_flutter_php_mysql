import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectableTile extends StatelessWidget {
  SelectableTile({super.key, required this.items, required this.onPress, required this.label});

  final String label;
  final List<String> items;
  final Function(String value) onPress;

  //local variable
  final Rx<int> currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          runSpacing: 8,
          spacing: 8,
          alignment: WrapAlignment.center,
          children: List.generate(items.length, (index) {
            return Obx(() {
              onPress(items[index]);
              return GestureDetector(
                onTap: () => currentIndex.value = index,
                child: Container(
                  height: 35,
                  width: (Get.size.width - 24) / 5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: currentIndex.value == index ? Colors.white : Colors.grey),
                    color: currentIndex.value == index ? Colors.purpleAccent.withOpacity(0.4) : Colors.black,
                  ),
                  child: Text(items[index], style: TextStyle(color: currentIndex.value == index ? Colors.white : Colors.grey.shade600)),
                ),
              );
            });
          }),
        ),
      ],
    );
  }
}
