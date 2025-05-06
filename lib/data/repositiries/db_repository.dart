import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/recipe/recipe.dart';

abstract class DbConnection {
  void addRecipe(Recipe recipe);

  void getRecipe();

  void deleteRecipe(int id);
}

class FirebaseRepository implements DbConnection {
  @override
  void addRecipe(Recipe recipe) {
    FirebaseFirestore.instance.collection('recipe').add(recipe.toJson());
  }

  @override
  void deleteRecipe(int id) {
    // TODO: implement deleteRecipe
  }

  @override
  void getRecipe() {
    // TODO: implement getRecipe
  }
}
