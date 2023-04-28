import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hw2/features/recipe/data/abstract_recipes_repository.dart';
import 'package:hw2/features/recipe/data/recipe_dto.dart';
import 'package:hw2/features/recipe/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'recipe_hive_adapter.dart';

part 'recipes_web_api_repository.g.dart';

class RecipesWebApiRepository implements BaseRecipesRepository {
  final dio = Dio();

  @override
  Future<List<Recipe>> load() async {
    final List<Recipe> recipes = [];
    final Response<dynamic> response;
    try {
      response = await dio
          .get('https://www.themealdb.com/api/json/v1/1/search.php?f=a');
    } on DioError catch (_) {
      rethrow;
    } catch (e) {
      throw DioError.connectionError(
          reason: e.toString(), requestOptions: RequestOptions());
    }
    final List<dynamic> recipesJson = response.data['meals'];
    for (var rec in recipesJson) {
      final recipe = dtoToRecipe(RecipeDto.fromJson(rec));
      recipes.add(recipe);
      if (recipes.length > 10) break;
    }
    await save(recipes);
    return recipes;
  }

  Future<void> save(List<Recipe> recipes) async {
    final box = await Hive.openBox<RecipeHive>('recipes');
    for (final recipe in recipes) {
      final base65Img = await _imageToBytes(recipe.info.imgPath);
      final newRecipe =
          recipe.copyWith(info: recipe.info.copyWith(base64Img: base65Img));
      await box.put(recipe.info.title, RecipeHive.fromRecipe(newRecipe));
    }
  }

  Future<String> _imageToBytes(String url) async {
    final response =
        await dio.get(url, options: Options(responseType: ResponseType.bytes));
    if (response.statusCode == 200) {
      final bytes = response.data as Uint8List;
      return String.fromCharCodes(bytes);
    }
    throw "Wrong URL: '$url'! Can't load an image.";
  }
}

@riverpod
RecipesWebApiRepository recipesWebApiRepository(
    RecipesWebApiRepositoryRef ref) {
  return RecipesWebApiRepository();
}

final connectivityProvider = StreamProvider((ref) =>
    FlutterNetworkConnectivity(isContinousLookUp: true)
        .getInternetAvailabilityStream());
