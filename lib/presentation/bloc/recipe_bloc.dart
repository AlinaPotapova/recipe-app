import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event/recipe_event.dart';
part 'state/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(const RecipeState()) {
    on<LoadRecipes>(_onLoadRecipes);
    on<RefreshRecipes>(_onRefreshRecipes);
  }

  Future<void> _onLoadRecipes(
    LoadRecipes event,
    Emitter<RecipeState> emit,
  ) async {
    emit(state.copyWith(status: RecipeStatus.loading));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      final recipes = ["Pasta", "Pizza", "Salad"];

      emit(state.copyWith(
        status: RecipeStatus.success,
        recipes: recipes,
      ));
    } catch (_) {
      emit(state.copyWith(status: RecipeStatus.failure));
    }
  }

  Future<void> saveRecipeToFavourite(Emitter<RecipeState> emit) async {
    emit(state.copyWith(status: RecipeStatus.loading));
    try {} catch (_) {
      emit(state.copyWith(status: RecipeStatus.failure));
    }
    ;
  }

  Future<void> _onRefreshRecipes(
    RefreshRecipes event,
    Emitter<RecipeState> emit,
  ) async {
    emit(state.copyWith(status: RecipeStatus.loading));

    // Simulate refreshing (could be API call)
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      status: RecipeStatus.success,
      recipes: state.recipes, // keep same or update
    ));
  }
}
