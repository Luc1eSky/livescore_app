import 'package:flutter/material.dart';

import '../../game/data/games.dart';
import '../../game/models/game.dart';
import '../../game/presentation/game_card.dart';

enum GameFilter { upcoming, current, finished }

class GameSchedulePage extends StatefulWidget {
  const GameSchedulePage({super.key});

  @override
  State<GameSchedulePage> createState() => _GameSchedulePageState();
}

class _GameSchedulePageState extends State<GameSchedulePage> {
  GameFilter selectedFilter = GameFilter.current;

  List<Game> get activeList {
    switch (selectedFilter) {
      case GameFilter.upcoming:
        return upcomingGames;
      case GameFilter.finished:
        return finishedGames;
      case GameFilter.current:
      default:
        return currentGames;
    }
  }

  void setFilter(GameFilter filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  Widget filterButton(String label, GameFilter filterType) {
    final isSelected = selectedFilter == filterType;

    return Expanded(
      child: OutlinedButton(
        onPressed: () => setFilter(filterType),
        style: OutlinedButton.styleFrom(
          backgroundColor:
              isSelected ? Colors.deepPurple.shade100 : Colors.white,
          foregroundColor: Colors.black,
          side: BorderSide(
            color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: isSelected ? Colors.black : Colors.grey[700],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Goaltimate Garfield Square',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                filterButton('Upcoming Games', GameFilter.upcoming),
                const SizedBox(width: 8),
                filterButton('Current Games', GameFilter.current),
                const SizedBox(width: 8),
                filterButton('Finished Games', GameFilter.finished),
              ],
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Use MediaQuery or constraints to adjust number of cards per row
                  int crossAxisCount = 1;
                  double width = constraints.maxWidth;

                  if (width > 600) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3, // Wider than tall
                    ),
                    itemCount: activeList.length,
                    itemBuilder: (context, index) {
                      final game = activeList[index];
                      return GameCard(game: game);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
