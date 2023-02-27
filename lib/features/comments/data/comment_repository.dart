import 'dart:async';

import 'package:hw2/features/comments/domain/comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_repository.g.dart';

class CommentRepository {
  Future<List<Comment>> load() async {
    return [
      Comment(
        comment: 'Test Comment',
        date: DateTime.now(),
        username: 'test_user',
      )
    ];
  }

  Future<void> save() async {}
}

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  final link = ref.keepAlive();
  Timer? timer;
  ref.onDispose(() {
    timer?.cancel();
  });
  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });
  ref.onResume(() {
    timer?.cancel();
  });
  return CommentRepository();
}
