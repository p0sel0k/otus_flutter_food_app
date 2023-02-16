import 'package:hw2/features/comments/application/comments_service.dart';
import 'package:hw2/features/comments/presentation/comment_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leave_comment_controller.g.dart';

@riverpod
class LeaveCommentController extends _$LeaveCommentController {
  @override
  void build() {}

  void submitComment(CommentState comment) {
    final commentService = ref.read(commentsServiceProvider);
    final commentModel = comment.toModel();
    commentService.whenData((value) => value.addComment(commentModel));
  }
}
