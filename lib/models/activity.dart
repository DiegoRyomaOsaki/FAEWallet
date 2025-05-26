class Activity {
  String title;

  bool isIncome;

  double total;

  DateTime createdAt;

  Activity({
    required this.title,
    required this.isIncome,
    required this.total,
    required this.createdAt,
  });
}

final List<Activity> recentActivity = [
  Activity(
    title: 'Miguel Ríos',
    isIncome: true,
    total: 250,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 2),
    ),
  ),
  Activity(
    title: 'Google Drive',
    isIncome: false,
    total: 138.5,
    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),
  ),
  Activity(
    title: 'Carlos Sánchez',
    isIncome: true,
    total: 531,
    createdAt: DateTime.now().subtract(
      const Duration(days: 7),
    ),
  ),
];

final List<Activity> allActivity = [
  Activity(
    title: 'Miguel Ríos',
    isIncome: true,
    total: 250,
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 1),
    ),
  ),
  Activity(
    title: 'Google Drive',
    isIncome: false,
    total: 138.5,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 2),
    ),
  ),
  Activity(
    title: 'Carlos Sánchez',
    isIncome: true,
    total: 531,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 9),
    ),
  ),
  Activity(
    title: 'Apple Store',
    isIncome: false,
    total: 250,
    createdAt: DateTime(
      2021,
      DateTime.now().month,
      DateTime.now().day - 1,
      11,
      45,
    ),
  ),
  Activity(
    title: 'Entrega de Pizza',
    isIncome: false,
    total: 58.90,
    createdAt: DateTime(
      2021,
      DateTime.now().month,
      DateTime.now().day - 1,
      14,
      30,
    ),
  ),
  Activity(
    title: 'Amazon',
    isIncome: false,
    total: 300,
    createdAt: DateTime(
      2021,
      DateTime.now().month,
      DateTime.now().day - 1,
      18,
      28,
    ),
  ),
];
