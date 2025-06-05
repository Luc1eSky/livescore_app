import 'package:flutter/material.dart';

import '../data/team_row.dart';
import '../models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Date + Time + Status + Division
            Row(
              children: [
                Text(
                  game.dateTimeFormatted, // e.g., Fri Jun 6 - 9:00 AM
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const SizedBox(width: 8),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 4),
            // Field Info
            Text(
              game.field,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            // Team Rows
            teamRow(
              context,
              name: game.teamA,
              score: game.scoreA,
              isBold: true,
            ),
            const SizedBox(height: 4),
            teamRow(context, name: game.teamB, score: game.scoreB),
          ],
        ),
      ),
    );
  }
}
