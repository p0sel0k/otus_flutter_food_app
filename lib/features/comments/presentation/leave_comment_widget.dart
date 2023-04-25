import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hw2/features/comments/presentation/comment_controller.dart';

class LeaveCommentWidget extends ConsumerStatefulWidget {
  final int id;
  const LeaveCommentWidget({super.key, required this.id});

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

  void addComment(int recipeId) {
    final comment = CommentState(
      comment: textController.text,
      username: 'anonymous',
      date: DateTime.now().toString(),
      img: '',
      recipeId: recipeId,
    );
    textController.clear();
    ref
        .read(commentsControllerProvider(widget.id).notifier)
        .submitComment(comment, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 13, right: 17, bottom: 14),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: 'оставить комментарий',
          suffixIcon: InkWell(
              onTap: () => context.push('/recipe/${widget.id}/camera'),
              child: const Icon(Icons.image)),
          border: const OutlineInputBorder(),
        ),
        onSubmitted: (str) => addComment(widget.id),
      ),
    );
  }
}
