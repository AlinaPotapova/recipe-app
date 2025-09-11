part of '../recipe_bloc.dart';

enum RecipeStatus { initial, loading, success, failure }

class RecipeState extends Equatable {
  final RecipeStatus status;
  final List<String> recipes;

  const RecipeState({
    this.status = RecipeStatus.initial,
    this.recipes = const [],
  });

  RecipeState copyWith({
    RecipeStatus? status,
    List<String>? recipes,
  }) {
    return RecipeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
    );
  }

  @override
  List<Object?> get props => [status, recipes];
}
