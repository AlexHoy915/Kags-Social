import 'package:flutter_application_1/models/comments.dart';

class BlogPost {
  String author;
  String category;
  String content;
  List<Comment> comments;

  BlogPost({
    required this.author,
    required this.category,
    required this.content,
    required this.comments,
  });
}
List<BlogPost> blogPosts = [
  BlogPost(
    author: 'New Jeep',
    category: 'New',
    content: 'I just got a new Jeep, and it\'s an absolute game-changer for my adventurous lifestyle...',
    comments: [
      Comment(author: 'User1', content: 'Great post!', timestamp: DateTime.now()),
    ],
  ),
  BlogPost(
    author: 'KAG\'s Winch',
    category: 'Mods',
    content: 'After installing a new winch from KAG\'s Jeep Supply, my Jeep\'s off-road readiness has significantly improved...',
    comments: [
      Comment(author: 'User2', content: 'That\'s really useful, thanks!', timestamp: DateTime.now()),
    ],
  ),
  BlogPost(
    author: 'Trail Explorer',
    category: 'Adventure',
    content: 'Exploring the backcountry trails has never been more exciting than with my lifted Jeep. The views are breathtaking!',
    comments: [
      Comment(author: 'User3', content: 'Would love to see pictures!', timestamp: DateTime.now()),
    ],
  ),
  BlogPost(
    author: 'Overland Nomad',
    category: 'Travel',
    content: 'Living out of my Jeep for the past year has taught me the true meaning of adventure. Every day is a new discovery!',
    comments: [
      Comment(author: 'User4', content: 'Overlanding goals!', timestamp: DateTime.now()),
    ],
  ),
  BlogPost(
    author: 'Rock Crawler',
    category: 'Technical',
    content: 'Rock crawling requires precision and patience. My recent upgrades have made a huge difference in my crawling capabilities.',
    comments: [
      Comment(author: 'User5', content: 'Impressive! What upgrades did you make?', timestamp: DateTime.now()),
    ],
  ),
  BlogPost(
    author: 'Muddy Trails',
    category: 'Off-road',
    content: 'There\'s nothing quite like the feeling of conquering a muddy trail. The messier, the better!',
    comments: [
      Comment(author: 'User6', content: 'Mud runs are the best!', timestamp: DateTime.now()),
    ],
  ),
];