import 'package:flutter/material.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.label,
    required this.onTap,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.activeIcon,
    required this.nonActiveIcon,
    this.iconSize,
  });

  final int index;
  final int currentIndex;
  final double? iconSize;
  final String label;
  final Color selectedColor;
  final Color unSelectedColor;
  final IconData activeIcon;
  final IconData nonActiveIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(5),
      shape: const CircleBorder(),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            currentIndex == index ? activeIcon : nonActiveIcon,
            color: currentIndex == index ? selectedColor : unSelectedColor,
            size: iconSize,
          ),
          Text(label, style: TextStyle(color: currentIndex == index ? selectedColor : unSelectedColor))
        ],
      ),
    );
  }
}
