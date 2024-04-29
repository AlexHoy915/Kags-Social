class Event {
  final String title;
  final String location;
  final DateTime dateTime;

  Event({required this.title, required this.location, required this.dateTime});
}

// Fake data for events
List<Event> events = [
  Event(
    title: 'Jeep Safari',
    location: 'Moab, Utah',
    dateTime: DateTime(2024, 4, 6, 14, 30),
  ),
  Event(
    title: 'Trail Cleanup',
    location: 'Pisgah Forest, NC',
    dateTime: DateTime(2024, 4, 20, 9, 0),
  ),
];
