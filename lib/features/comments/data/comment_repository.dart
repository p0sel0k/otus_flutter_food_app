import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hw2/features/comments/data/comment_hive_adapter.dart';
import 'package:hw2/features/comments/domain/comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_repository.g.dart';

class CommentRepository {
  Future<List<Comment>> load(int recipeId) async {
    List<Comment> comments = [
      Comment(
        comment: 'Test Comment',
        date: DateTime.now(),
        username: 'test_user',
        img: '',
        recipeId: recipeId,
      )
    ];
    final box = await Hive.openBox<CommentHive>('comments');

    for (final key in box.keys) {
      final commentHive = box.get(key);
      if (commentHive == null) {
        throw 'Hive Error! Key does not exist';
      } else if (commentHive.recipeId == recipeId) {
        comments.add(commentHive.intoComment());
      }
    }
    return comments;
  }

  Future<void> save(Comment comment) async {
    final box = await Hive.openBox<CommentHive>('comments');
    await box.put(
        '${comment.date}${comment.username}', CommentHive.fromModel(comment));
  }
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
