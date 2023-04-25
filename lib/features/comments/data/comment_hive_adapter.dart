import 'package:hive/hive.dart';
import 'package:hw2/features/comments/domain/comment.dart';

part 'comment_hive_adapter.g.dart';

@HiveType(typeId: 5)
class CommentHive {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String comment;
  @HiveField(3)
  final String img;
  @HiveField(4)
  final int recipeId;

  CommentHive({
    required this.recipeId,
    required this.username,
    required this.date,
    required this.comment,
    required this.img,
  });

  factory CommentHive.fromModel(Comment comment) => CommentHive(
        username: comment.username,
        comment: comment.comment,
        date: comment.date.toString(),
        img: comment.img,
        recipeId: comment.recipeId,
      );

  Comment intoComment() => Comment(
        username: username,
        comment: comment,
        date: DateTime.parse(date),
        img: img,
        recipeId: recipeId,
      );
}
