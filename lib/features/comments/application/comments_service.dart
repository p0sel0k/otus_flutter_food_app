import 'dart:async';

import 'package:hw2/features/comments/data/comment_repository.dart';
import 'package:hw2/features/comments/domain/comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comments_service.g.dart';

class CommentsService {
  final CommentRepository commentRepository;
  final List<Comment> _comments = [];

  List<Comment> get comments => _comments;

  CommentsService({required this.commentRepository});

  Future<List<Comment>> load(int recipeId) async {
    _comments.addAll(await commentRepository.load(recipeId));
    return _comments;
  }

  void addComment(Comment comment) {
    _comments.add(comment);
    commentRepository.save(comment);
  }
}

@riverpod
Future<CommentsService> commentsService(
    CommentsServiceRef ref, int recipeId) async {
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

  final service =
      CommentsService(commentRepository: ref.watch(commentRepositoryProvider));
  await service.load(recipeId);
  return service;
}
