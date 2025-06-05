class Game {
  final DateTime dateTime;
  final String teamA;
  final String teamB;
  final int scoreA;
  final int scoreB;
  final String field;

  Game({
    required this.dateTime,
    required this.teamA,
    required this.teamB,
    required this.scoreA,
    required this.scoreB,
    required this.field,
  });

  String get dateTimeFormatted {
    return '${dateTime.day} ${_month(dateTime.month)} ${dateTime.year} \u2014 ${_formatTime(dateTime)}';
  }

  String _month(int m) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[m];
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour > 12 ? dt.hour - 12 : dt.hour;
    final suffix = dt.hour >= 12 ? 'PM' : 'AM';
    return '$hour:00 $suffix';
  }
}
