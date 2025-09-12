import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/domain/entities/recipe/hive_recipe.dart';

class HiveService {
  static const String _boxName = "recipeBox";

  static final Box<HiveRecipe> _box = Hive.box("recipeBox");

  static Future<void> init() async {
    //_box = await Hive.openBox<HiveRecipe>(_boxName);
  }

  ValueListenable<Box<HiveRecipe>> get listenable => _box.listenable();

  Future<void> add(HiveRecipe recipe) async {
    await _box.add(recipe);
  }

  List<HiveRecipe> read() {
    return _box.values.toList();
  }

  Future<void> delete(int index) async {
    await _box.deleteAt(index);
  }

  Future<void> deleteAll() async {
    await _box.clear();
  }
}
