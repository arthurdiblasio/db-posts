import 'package:http/http.dart' as http;

class ApiProvider {
  Future<http.Response> fetchPosts() {
    return http.get('https://jsonplaceholder.typicode.com/posts');
  }

  Future<http.Response> fetchIdPosts(int id) {
    return http.get('https://jsonplaceholder.typicode.com/posts/$id');
  }

  Future<http.Response> fetchUsers() {
    return http.get('https://jsonplaceholder.typicode.com/users');
  }

  Future<http.Response> fetchIdUsers(int id) {
    return http.get('https://jsonplaceholder.typicode.com/user/$id');
  }
}
