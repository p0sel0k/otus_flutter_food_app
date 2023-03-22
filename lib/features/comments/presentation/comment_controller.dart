import 'package:hw2/features/comments/application/comments_service.dart';
import 'package:hw2/features/comments/domain/comment.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_controller.g.dart';

@riverpod
class CommentsController extends _$CommentsController {
  @override
  List<CommentState> build() {
    state = ref.watch(commentsServiceProvider).when(
        data: (CommentsService data) =>
            data.comments.map((e) => CommentState.fromModel(e)).toList(),
        error: (error, _) => throw error,
        loading: () => []);
    return state;
  }

  void submitComment(CommentState comment) {
    final commentService = ref.read(commentsServiceProvider);
    final commentModel = comment.toModel();
    commentService.whenData((value) => value.addComment(commentModel));
    state = [...state, CommentState.fromModel(commentModel)];
  }
}

class CommentState {
  final String username;
  final String date;
  final String comment;

  CommentState({
    required this.username,
    required this.date,
    required this.comment,
  });

  factory CommentState.fromModel(Comment comment) => CommentState(
        comment: comment.comment,
        username: comment.username,
        date: _formatDate(comment.date),
      );

  static String _formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }

  Comment toModel() {
    return Comment(
      username: username,
      date: DateTime.parse(date),
      comment: comment,
    );
  }
}
