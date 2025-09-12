import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/recipe/recipe.dart';
import 'recipe_repository.dart';

class FirebaseRepository implements RecipeRepository {
  @override
  void addRecipe(Recipe recipe) {
    FirebaseFirestore.instance.collection('recipe').add(recipe.toJson());
  }

  @override
  void deleteRecipe(int id) {}

  @override
  void getRecipe() {}
}
