import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TabButton({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange[200] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
