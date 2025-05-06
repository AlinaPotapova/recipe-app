import 'package:flutter/material.dart';

import '../../domain/entities/recipe/hive_recipe.dart';

class RecipeView extends StatefulWidget {
  const RecipeView(this.recipe, {super.key});

  final List<HiveRecipe> recipe;

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
                title: Text(widget.recipe[index].name!),
                subtitle: Text(widget.recipe[index].photoUrl!),
              )), /*Column(
          children: [
            Text(widget.recipe.name),
            Text(widget.recipe.category),
            Text(widget.recipe.cuisineType),
          ],
        )*/
    );
  }
}
