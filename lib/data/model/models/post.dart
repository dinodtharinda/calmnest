class Post {
  final String id;
  final String message;
  final String image;
  final String userId;
  final List<dynamic> comments;
  final List<dynamic> likes;

  Post({
    required this.id,
    required this.message,
    required this.image,
    required this.userId,
    required this.comments,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? '',
      message: json['message'] ?? '',
      image: json['image'] ?? '',
      userId: json['user_id'] ?? '',
      comments: json['comments'] ?? [],
      likes: json['likes'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'image': image,
      'user_id': userId,
      'comments': comments,
      'likes': likes,
    };
  }

    static List<Post> parsePosts(List<dynamic> list) {
    return list.map((json) => Post.fromJson(json)).toList();
  }
}
