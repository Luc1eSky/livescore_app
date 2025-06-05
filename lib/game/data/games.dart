import '../models/game.dart';

final List<Game> currentGames = List.generate(
  5,
  (index) => Game(
    dateTime: DateTime(2025, 5, 19, 7),
    teamA: 'Dark',
    teamB: 'Light',
    scoreA: 5,
    scoreB: 8,
    field: 'Garfield Square #1',
  ),
);

final List<Game> finishedGames = List.generate(
  5,
  (index) => Game(
    dateTime: DateTime(2025, 5, 18, 7),
    teamA: 'Dark',
    teamB: 'Light',
    scoreA: 12,
    scoreB: 10,
    field: 'Garfield Square #1',
  ),
);

final List<Game> upcomingGames = List.generate(
  5,
  (index) => Game(
    dateTime: DateTime(2025, 5, 20, 7),
    teamA: 'Dark',
    teamB: 'Light',
    scoreA: 0,
    scoreB: 0,
    field: 'Garfield Square #1',
  ),
);
