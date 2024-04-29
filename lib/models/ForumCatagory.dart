class ForumCategory {
  final String name;
  final int postCount;

  ForumCategory({required this.name, required this.postCount});
}

class Expert {
  final String name;
  final String areaOfExpertise;
  final String avatarUrl;

  Expert({required this.name, required this.areaOfExpertise, required this.avatarUrl});
}

List<ForumCategory> forumCategories = [
  ForumCategory(name: 'Modifications', postCount: 32),
  ForumCategory(name: 'Tech Support', postCount: 56),
  ForumCategory(name: 'Adventure Stories', postCount: 23),
];

List<Expert> experts = [
  Expert(name: 'John Doe', areaOfExpertise: 'Trail Navigation', avatarUrl: 'assets/john.png'),
  Expert(name: 'Bob Smith', areaOfExpertise: 'Jeep Modifications', avatarUrl: 'assets/bob.jpg'),
];