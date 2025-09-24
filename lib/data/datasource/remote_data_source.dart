import 'package:dio/dio.dart';
import 'package:recipe_app/data/constant/constant.dart';
import 'package:recipe_app/data/datasource/data_source.dart';
import 'package:recipe_app/utils/di/dependency-injection.dart';

import '../../domain/entities/recipe/hive_recipe.dart';

class RemoteDataSource implements DataSource {

 
  RemoteDataSource();
  @override
  Future<Map> fetchRandomRecipe() async {
    try {
      Response response =
          await dio.get(kfetchRandomRecipe);
      if (response.statusCode == 200) {
        print('Success');
      }
      // refactor
      return response.data.first;
    } catch (e) {
      print('Error fetching users: $e');
      return {};
    }
  }

  Future<List<HiveRecipe>> fetchRecipes(String ingredient) async {
    try {
      final response = await dio.get(
        kfetchAllRecipes,
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
