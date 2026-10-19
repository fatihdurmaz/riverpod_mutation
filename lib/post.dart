class Post {
  const Post({required this.id, required this.subject});

  final int id;
  final String subject;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'] as int, subject: json['title'] as String);
  }
}
