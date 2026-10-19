import 'package:dio/dio.dart';

import 'post.dart';

class PostRepository {
  PostRepository(this._dio);

  final Dio _dio;

  Future<List<Post>> getRequests() async {
    final response = await _dio.get<List<dynamic>>('posts');

    return (response.data ?? [])
        .map((e) => Post.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<String> sendRequest(int id) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'posts',
      data: {
        'title': 'Servis Talebi $id',
        'body': 'Servis talebi oluşturuldu',
        'userId': 1,
      },
    );

    return 'İşlem başarılı! ID: ${response.data!['id']}';
  }
}
