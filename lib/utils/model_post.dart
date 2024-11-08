import 'dart:ffi';
import 'dart:typed_data';

enum PostType {
  EVENT,
  COURSE,
}

class Post {
  Int? id;
  String title;
  Uint8List? img;
  DateTime? createdAt;
  String content;
  PostType type;
  final List<PostOnAdmins>? admins;

  Post({
    this.id,
    required this.title,
    this.img,
    this.createdAt,
    required this.content,
    required this.type,
    this.admins,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'type': type.toString().split('.').last,
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      img: json['cover'] != null ? Uint8List.fromList(json['cover'].cast<int>()) : null,
      createdAt: DateTime.parse(json['createdAt']),
      content: json['content'],
      type: PostType.values.byName(json['type']),
      admins: json['admins'] != null
          ? List<PostOnAdmins>.from(json['admins'].map((admin) => PostOnAdmins.fromJson(admin)))
          : null,
    );
  }
}
class PostOnAdmins {
  final int adminId;
  final int postId;
  final Admin? admin;
  final Post? post;

  PostOnAdmins({
    required this.adminId,
    required this.postId,
    this.admin,
    this.post,
  });

  factory PostOnAdmins.fromJson(Map<String, dynamic> json) {
    return PostOnAdmins(
      adminId: json['adminId'],
      postId: json['postId'],
      admin: json['admin'] != null ? Admin.fromJson(json['admin']) : null,
      post: json['post'] != null ? Post.fromJson(json['post']) : null,
    );
  }
}

class Admin {
  final int id;
  // Adicione outros campos de Admin conforme necessário

  Admin({required this.id});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(id: json['id']);
  }
}