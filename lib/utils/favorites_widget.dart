import 'package:flutter/material.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({super.key});

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: isFavorite
            ? Image.asset('assets/icons/fav.png')
            : Image.asset('assets/icons/unfav.png'),
        onTap: () => setState(() {
              isFavorite = !isFavorite;
            }));
  }
}
