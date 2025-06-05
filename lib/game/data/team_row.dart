import 'package:flutter/material.dart';

Widget teamRow(
  BuildContext context, {
  required String name,
  required int score,
  bool isBold = false,
}) {
  return Row(
    children: [
      // emoji flag or icon
      const SizedBox(width: 6),
      Text(
        score.toString(),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
