import 'package:flutter/material.dart';

import 'filter/models/game_filter_button.dart';
import 'game/data/games.dart';
import 'game/models/game.dart';
import 'game/presentation/game_card.dart';

void main() {
  runApp(MaterialApp(home: GameSchedulePage()));
}

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
      child: GestureDetector(
        onTap: () => setFilter(filterType),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange[300] : Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(title: const Text('EVENT: Goaltimate Garfield Square')),
      body: Column(
        children: [
          Row(
            children: [
              filterButton('Upcoming Games', GameFilter.upcoming),
              filterButton('Current Games', GameFilter.current),
              filterButton('Finished Games', GameFilter.finished),
            ],
          ),
          Expanded(
            child:
                activeList.isEmpty
                    ? const Center(child: Text('No games available.'))
                    : ListView.builder(
                      itemCount: activeList.length,
                      itemBuilder: (context, index) {
                        final game = activeList[index];
                        return GameCard(game: game);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class ToggleTabs extends StatelessWidget {
  const ToggleTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        TabButton(label: 'Upcoming Games'),
        TabButton(label: 'Current Games', isSelected: true),
        TabButton(label: 'Finished Games'),
      ],
    );
  }
}
