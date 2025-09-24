import 'package:recipe_app/data/datasource/hive_recipe_data_source.dart';
import 'package:recipe_app/utils/extensions/mapper.dart';

import '../../../domain/entities/recipe/recipe.dart';
import 'recipe_repository.dart';

class LocalDatabaseRepository implements RecipeRepository {
  LocalDatabaseRepository(this.hiveService);

  HiveRecipeDataSource hiveService;

  @override
  Future<void> addRecipe(Recipe recipe) async {
    return await hiveService.add(recipe.toHiveRecipe());
  }
  @override
  void getRecipe() {
    hiveService.read();
  }
   @override
  Future<void> deleteRecipe(int id) async {
    hiveService.delete(id);
  }
  Future<void> deleteAllRecipes() async {
    hiveService.deleteAll();
  }

}
