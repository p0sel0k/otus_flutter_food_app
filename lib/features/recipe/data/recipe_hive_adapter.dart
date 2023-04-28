import 'package:hive/hive.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:hw2/utils/constants.dart';
import 'package:hw2/utils/record.dart';

part 'recipe_hive_adapter.g.dart';

@HiveType(typeId: 1)
class RecipeHive {
  @HiveField(0)
  final RecipeInfoHive info;
  @HiveField(1)
  final RecipeDetailsHive details;

  RecipeHive({required this.info, required this.details});

  factory RecipeHive.fromRecipe(Recipe r) => RecipeHive(
        info: RecipeInfoHive.fromRecipeInfo(r.info),
        details: RecipeDetailsHive.fromRecipeDetails(r.details),
      );

  Recipe intoRecipe() => Recipe(
        info: info.intoInfo(),
        details: details.intoDetails(),
      );
}

@HiveType(typeId: 2)
class RecipeInfoHive {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final String imgPath;
  @HiveField(3, defaultValue: baseImg)
  final String base64Img;
  @HiveField(4, defaultValue: false)
  final bool isFavorite;

  RecipeInfoHive({
    required this.isFavorite,
    required this.base64Img,
    required this.title,
    required this.time,
    required this.imgPath,
  });

  factory RecipeInfoHive.fromRecipeInfo(RecipeInfo r) => RecipeInfoHive(
        isFavorite: r.isFavorite,
        title: r.title,
        time: r.time,
        imgPath: r.imgPath,
        base64Img: r.base64Img,
      );

  RecipeInfo intoInfo() => RecipeInfo(
        time: time,
        title: title,
        imgPath: imgPath,
        base64Img: base64Img,
        isFavorite: isFavorite,
      );
}

@HiveType(typeId: 3)
class RecipeDetailsHive {
  @HiveField(0)
  final List<RecordHive> stepsWithDesription;
  @HiveField(1)
  final List<RecordHive> ingredients;

  RecipeDetailsHive({
    required this.stepsWithDesription,
    required this.ingredients,
  });

  factory RecipeDetailsHive.fromRecipeDetails(RecipeDetails r) =>
      RecipeDetailsHive(
        stepsWithDesription: r.stepsWithDescriprion
            .map((e) => RecordHive.fromRecord(e))
            .toList(),
        ingredients:
            r.ingredients.map((e) => RecordHive.fromRecord(e)).toList(),
      );

  RecipeDetails intoDetails() => RecipeDetails(
        stepsWithDescriprion:
            stepsWithDesription.map((e) => e.intoRecord()).toList(),
        ingredients: ingredients.map((e) => e.intoRecord()).toList(),
      );
}

@HiveType(typeId: 4)
class RecordHive {
  @HiveField(0)
  final String first;
  @HiveField(1)
  final String second;

  RecordHive(this.first, this.second);

  factory RecordHive.fromRecord(CustomRecord rec) =>
      RecordHive(rec.first, rec.second);

  CustomRecord intoRecord() => CustomRecord(first: first, second: second);
}
