import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dio_client.dart';
import 'post.dart';
import 'post_repository.dart';

part 'post_viewmodel.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  final _repository = PostRepository(DioClient.instance);

  @override
  FutureOr<List<Post>> build() {
    final posts = _repository.getRequests();
    return posts;
  }

  Future<String> sendRequest(int id) {
    final result = _repository.sendRequest(id);
    return result;
  }
}
