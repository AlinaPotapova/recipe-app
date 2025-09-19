part of 'recipe_bloc.dart';

class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object?> get props => [];
}

class LoadRecipes extends RecipeEvent {}

class RefreshRecipes extends RecipeEvent {}

class SaveRecipeToFavourite extends RecipeEvent {}
