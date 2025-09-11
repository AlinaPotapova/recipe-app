import '../../domain/entities/recipe/hive_recipe.dart';
import '../../domain/entities/recipe/recipe.dart';

extension RecipeMapper on Recipe {
  HiveRecipe toHiveRecipe({String? photoUrl, bool? isFavorite = false}) {
    return HiveRecipe(
      id: id,
      photoUrl: photoUrl,
      name: name,
      isFavorite: isFavorite,
    );
  }
}

extension HiveRecipeMapper on HiveRecipe {
  Recipe toRecipe({
    List<String>? ingredients,
    String? instructions,
    int? cookTime,
    String? cuisineType,
    String? category,
  }) {
    return Recipe(
      id: id,
      ingredients: ingredients,
      name: name,
      instructions: instructions,
      cookTime: cookTime,
      cuisineType: cuisineType,
      category: category,
    );
  }
}
