class Album{
  final int? userId;
  final String? name;
  final int? id;
  Album({
    required this.userId,
    required this.name,
    required this.id,
  });
  
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int?,
      name: json['title'] as String?,
      userId: json['userId'] as int?,
    );
  }
}