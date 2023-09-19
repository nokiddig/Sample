import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/post.dart';
class NetworkRequest {
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  static List<Post> parsePost(String response) {
    var list = json.decode(response) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      return compute(parsePost, response.body);
    }
    else if  (response.statusCode == 404){
      throw Exception("No post found");
    }
    else{
      throw Exception("cannot fetch");
    }
  }
}