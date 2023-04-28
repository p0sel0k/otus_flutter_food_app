import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/comments/presentation/comment_controller.dart';

class CommentsWidget extends ConsumerWidget {
  final int recipeId;
  const CommentsWidget({Key? key, required this.recipeId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(commentsControllerProvider(recipeId));
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Column(
        children: [...comments.map((e) => _Comment(comment: e)).toList()],
      ),
    );
  }
}

class _Comment extends StatelessWidget {
  final CommentState comment;
  const _Comment({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 17, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/usr.png',
            width: 63,
            height: 63,
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      comment.username,
                      style: const TextStyle(
                        color: Color.fromRGBO(46, 204, 113, 1),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      comment.date,
                      style: const TextStyle(
                        color: Color.fromRGBO(194, 194, 194, 1),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  comment.comment,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                comment.img != ''
                    ? Image.memory(
                        Uint8List.fromList(comment.img.codeUnits),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
