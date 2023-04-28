import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw2/features/comments/application/comments_service.dart';
import 'package:hw2/features/recipe/data/recipes_web_api_repository.dart';
import 'package:hw2/utils/favorites_widget.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class RecipeHeader extends ConsumerWidget {
  final String title;
  final String imgPath;
  final Uint8List cachedImg;
  final String time;
  final int id;

  const RecipeHeader({
    super.key,
    required this.id,
    required this.title,
    required this.imgPath,
    required this.cachedImg,
    required this.time,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const color = Color.fromRGBO(22, 89, 50, 1);
    final connectivity = ref.watch(connectivityProvider);
    final commentsService = ref.read(commentsServiceProvider(id));
    return Container(
      padding:
          const EdgeInsets.only(left: 17.0, top: 38.0, bottom: 16, right: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 11),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(46, 204, 113, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              FavoriteIconButton(id: id),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    commentsService.whenData((value) async =>
                        SwipeImageGallery(context: context, children: [
                          Image.network(imgPath),
                          ...(await commentsImages(value, id)),
                          // Image.memory(cachedImg),
                        ]).show());
                  },
                  child: connectivity.when(
                    data: (bool data) =>
                        data ? Image.network(imgPath) : Image.memory(cachedImg),
                    error: (Object error, StackTrace stackTrace) =>
                        Image.memory(cachedImg),
                    loading: () => const SizedBox(
                      width: 136,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

Future<List<Image>> commentsImages(
  CommentsService service,
  int id,
) async {
  final comments = await service.load(id);
  return comments
      .where((comment) => comment.img != '')
      .map((comment) => Image.memory(Uint8List.fromList(comment.img.codeUnits)))
      .toList();
}
