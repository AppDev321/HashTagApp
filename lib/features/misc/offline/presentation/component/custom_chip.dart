import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;
  final String tagCount;

  const CustomChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.tagCount = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : (Get.isDarkMode ? Colors.blueGrey.shade200 : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.transparent),
        ),
        child: Text(
          tagCount.isEmpty? label: "$label $tagCount" ,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black ,fontSize: 12),
        ),
      ),
    );
  }
}
