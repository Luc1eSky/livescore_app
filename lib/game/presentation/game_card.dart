import 'package:flutter/material.dart';

import '../models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.sports_soccer, color: Colors.redAccent),
        title: Text('${game.teamA} vs ${game.teamB}'),
        subtitle: Text('${game.dateTimeFormatted}  |  ${game.field}'),
        trailing: Text(
          '${game.scoreA}  vs  ${game.scoreB}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
