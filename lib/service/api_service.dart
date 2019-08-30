import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_study/models/index.dart';

class ApiService {
  ApiService() {
    //
  }

  String _authority = 'api.github.com';

  // 网络请求的公共处理方法
  Future<Map<String, dynamic>> _doRequest(
    Uri uri, {
    String method = 'GET',
    Map<String, String> headers,
    dynamic body,
    // Map<String, String> queryParameters,
  }) async {
    Map<String, dynamic> ret;
    http.Response response;

    if (method == 'GET') {
      response = await http.get(uri, headers: headers);
    } else if (method == 'Post') {
      response = await http.post(uri, headers: headers, body: body);
    } else {
      // TODO: 支持其它method
    }

    if (response != null) {
      if (response.statusCode == 200) {
        ret = {
          'data': jsonDecode(response.body),
        };
      } else {
        // TODO: 错误处理
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }

    return ret;
  }

  Future<User> getUser(String userName) async {
    var r = await _doRequest(
      Uri.https(_authority, '/users/$userName'),
    );
    if (r == null) return null;
    return User.fromJson(r['data']);
  }

  Future<List<Repo>> getRepos(String userName, int page, [int pageSize = 20]) async {
    var uri = Uri.https(_authority, '/users/$userName/repos', {
      'page': page.toString(),
      'page_size': pageSize.toString(),
    });
    var r = await _doRequest(uri);
    if (r == null) return [];
    return (r['data'] as List).map<Repo>((e) => Repo.fromJson(e)).toList();
  }
}

final apiService = new ApiService();
