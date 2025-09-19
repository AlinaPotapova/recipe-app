import 'package:dio/dio.dart';
import 'package:recipe_app/data/datasource/data_source.dart';
import 'package:recipe_app/data/services/hive_service.dart';

import '../../domain/entities/recipe/hive_recipe.dart';

class RemoteDataSource implements DataSource {
  HiveService hiveService;
  RemoteDataSource({required this.hiveService});

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

  Future<List<HiveRecipe>> fetchRecipe(String ingredient) async {
    try {
      final response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?',
        queryParameters: {
          'i': ingredient,
        },
      );
      final meals = response.data["meals"];
      if (meals is List) {
        return meals
            .map<HiveRecipe>((item) => HiveRecipe(
                  id: item["idMeal"],
                  name: item["strMeal"],
                  photoUrl: item["strMealThumb"],
                  isFavorite: false,
                ))
            .toList();
      }
      return [];
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }
}
