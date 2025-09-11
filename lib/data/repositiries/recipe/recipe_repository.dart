import '../../../domain/entities/recipe/recipe.dart';

abstract class RecipeRepository {
  RecipeRepository() {}

  void addRecipe(Recipe recipe) {}

  void getRecipe() {}

  void deleteRecipe(int id) {}
}
