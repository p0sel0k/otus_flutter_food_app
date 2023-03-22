import 'package:flutter/material.dart';
import 'package:hw2/utils/record.dart';

class Ingredients extends StatelessWidget {
  final List<CustomRecord> ingredients;
  const Ingredients({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(22, 89, 50, 1);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Ингредиенты',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 8, top: 15, bottom: 18, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromRGBO(121, 118, 118, 1),
                width: 3,
              ),
            ),
            child: Column(
              children: showIngredients(ingredients),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 232,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: color, width: 3),
                ),
                child: const Center(
                  child: Text(
                    'Проверить наличие',
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> showIngredients(List<CustomRecord> ingredients) {
  return ingredients
      .map((e) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '• ${e.first}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                e.second,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ))
      .toList();
}
