import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectableTile extends StatelessWidget {
  SelectableTile({
    super.key,
    this.width,
    required this.items,
    this.itemFontSize = 14,
    required this.label,
    this.labelFontSize = 18,
    this.labelColor = Colors.white,
    required this.onPress,
  });
  final double? width;
  final List<String> items;
  final double? itemFontSize;
  final String label;
  final double? labelFontSize;
  final Color? labelColor;
  final Function(String value) onPress;

  //local variable
  final Rx<int> currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var primary = Get.theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: TextStyle(color: labelColor, fontSize: labelFontSize, fontWeight: FontWeight.bold)),
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
                  width: width ?? (Get.size.width - 24) / 5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: currentIndex.value == index ? Get.theme.colorScheme.outline : Get.theme.colorScheme.onSecondary),
                    color: currentIndex.value == index ? primary.withOpacity(0.4) : Get.theme.colorScheme.primaryContainer,
                  ),
                  child: Text(items[index], style: TextStyle(color: currentIndex.value == index ? Colors.white : Colors.grey, fontSize: itemFontSize)),
                ),
              );
            });
          }),
        ),
      ],
    );
  }
}
