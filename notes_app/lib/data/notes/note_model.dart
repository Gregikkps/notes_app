class Note {
  final String id;
  final String content;
  final DateTime createdAt;

  Note({required this.id, required this.content, required this.createdAt});

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        createdAt = json['createdAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'createdAt': createdAt,
      };
}
