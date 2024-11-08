import 'dart:convert';

import 'package:conectadas_app/utils/base_url.dart';
import 'package:conectadas_app/utils/model_post.dart';
import 'package:http/http.dart' as http;

class PostService {
  //AuthService authService = AuthService();

  // Cria um novo post
  Future<Post?> createPost(Post post) async {
    final response = await http.post(
      Uri.parse('${BaseUrl.baseUrl}/posts/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      ///print('Erro ao criar post: ${response.body}');
      return null;
    }
  }

  // Retorna todos os posts
  Future<List<dynamic>> getPosts() async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/posts/list'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar posts');
    }
  }

  // Get a post by ID
  Future<Post> getPostById(int id) async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/posts/list/$id'));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  // Update a post by ID
  Future<Post> updatePost(int id, Post post) async {
    final response = await http.patch(
      Uri.parse('${BaseUrl.baseUrl}/posts/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }

  // Delete a post by ID
  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('${BaseUrl.baseUrl}/posts/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}