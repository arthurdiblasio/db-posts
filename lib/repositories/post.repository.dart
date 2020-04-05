import 'dart:convert';

import 'package:blog_arthur/models/comment.model.dart';
import 'package:blog_arthur/models/post.model.dart';
import 'package:blog_arthur/models/user.model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Post>> getAllPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    Response response = await Dio().get(url);
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }

  Future<List<User>> getAllUsers() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    Response response = await Dio().get(url);
    return (response.data as List).map((user) => User.fromJson(user)).toList();
  }

  Future<User> getUsersId(int id) async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users/$id');

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Comment>> getPostIdComment(int id) async {
    var url = "https://jsonplaceholder.typicode.com/posts/$id/comments";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((post) => Comment.fromJson(post))
        .toList();
  }

  // Tentei implementar, mas não consegui
  createComment(data, int id) async {
    var url = "https://jsonplaceholder.typicode.com/posts/$id/comments";
    Response response = await Dio().post(
      url,
      data: {'body': data, 'email': 'email@email.com', 'name': 'nome 10'},
    );
    print('response =>>> $response');
    return response;
  }
}
