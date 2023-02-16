import 'package:flutter/material.dart';
import 'package:hw2/utils/favorites_widget.dart';

class RecipeHeader extends StatelessWidget {
  final String title;
  final int id;
  final String time;

  const RecipeHeader({
    required this.title,
    required this.id,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 17.0, top: 38.0, bottom: 16, right: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              const FavoriteIconButton(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/recipe$id.png',
                  scale: 0.2,
                  errorBuilder: (context, error, stackTrace) => Text(
                      "An error occured while\nloading the image!\nThere're no image in\nassets with name:\nrecipe$id.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
