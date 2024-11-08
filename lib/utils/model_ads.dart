enum AdType {
  PRODUCT, SERVICE, COLLAB
}

class Ad {
  String title;
  String content;
  AdType type;

  Ad({
    required this.title,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'type': type.toString().split('.').last,
    };
  }

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      title: json['title'],
      content: json['content'],
      type: AdType.values.firstWhere((e) => e.toString().split('.').last == json['type']),
    );
  }
}
