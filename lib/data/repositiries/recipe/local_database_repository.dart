import 'package:recipe_app/data/services/hive_service.dart';
import 'package:recipe_app/utils/extensions/mapper.dart';

import '../../../domain/entities/recipe/recipe.dart';
import 'recipe_repository.dart';

class LocalDatabaseRepository implements RecipeRepository {
  LocalDatabaseRepository(this.hiveService);

  HiveService hiveService;

  @override
  void addRecipe(Recipe recipe) async {
    return await hiveService.add(recipe.toHiveRecipe());
  }

  void getRecipe() {
    hiveService.read();
  }

  void deleteRecipe(int id) {}
}
