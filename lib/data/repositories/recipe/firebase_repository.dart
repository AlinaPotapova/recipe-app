import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/data/datasource/remote_data_source.dart';

import '../../../domain/entities/recipe/recipe.dart';
import 'recipe_repository.dart';

class FirebaseRepository implements RecipeRepository {

  FirebaseRepository(this.remoteDataSource);

  RemoteDataSource remoteDataSource;

  @override
  void addRecipe(Recipe recipe) {
    FirebaseFirestore.instance.collection('recipe').add(recipe.toJson());
  }

  Future<void> fetchRandomRecipe() async{ 
     await remoteDataSource.fetchRandomRecipe();
  }
   Future<void> fetchRecipes(String ingredient) async{ 
     await remoteDataSource.fetchRecipes(ingredient);
  }
 
  @override
  void deleteRecipe(int id) {}

  @override
  void getRecipe() {}
}
