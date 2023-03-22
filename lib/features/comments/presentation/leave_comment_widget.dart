import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/comments/presentation/comment_controller.dart';

class LeaveCommentWidget extends ConsumerStatefulWidget {
  const LeaveCommentWidget({super.key});

  @override
  ConsumerState<LeaveCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends ConsumerState<LeaveCommentWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void addComment() {
    final comment = CommentState(
      comment: textController.text,
      username: 'anonymous',
      date: DateTime.now().toString(),
    );
    textController.clear();
    ref.read(commentsControllerProvider.notifier).submitComment(comment);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 13, right: 17, bottom: 14),
      child: TextField(
        controller: textController,
        decoration: const InputDecoration(
          labelText: 'оставить комментарий',
          suffixIcon: Icon(Icons.image),
          border: OutlineInputBorder(),
        ),
        onSubmitted: (str) => addComment(),
      ),
    );
  }
}
