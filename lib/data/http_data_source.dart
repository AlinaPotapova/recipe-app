import 'package:dio/dio.dart';
import 'package:recipe_app/data/data_source.dart';
import 'package:recipe_app/data/services/hive_service.dart';

import '../domain/entities/recipe/hive_recipe.dart';

class HttpDataSource implements DataSource {
  HiveService hiveService = HiveService();

  @override
  Future<Map> fetchRandomRecipe() async {
    try {
      Response response =
          await Dio().get('https://www.themealdb.com/api/json/v1/1/random.php');
      if (response.statusCode == 200) {
        print('Success');
      }
      return response.data.first;
    } catch (e) {
      print('Error fetching users: $e');
      return {};
    }
  }

  Future<List> fetchRecipe(String text) async {
    Response response;
    List<HiveRecipe> meal = [];

    try {
      //meal = [];
      response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?',
        queryParameters: {
          'i': text,
        },
      );
      final List list = response.data["meals"];
      for (final item in list) {
        meal.add(HiveRecipe(
            id: item["idMeal"],
            name: item["strMeal"],
            photoUrl: item["strMealThumb"],
            isFavorite: false));
      }
    } catch (e) {
      print('Error fetching users: $e');
      //return [];
    }
    return meal;
  }
}
