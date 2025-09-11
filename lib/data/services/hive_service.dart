import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/domain/entities/recipe/hive_recipe.dart';

class HiveService {
  static const String _boxName = "recipeBox";

  static final Box<HiveRecipe> _box = Hive.box("recipeBox");

  // 3. Initialize the box asynchronously.
  static Future<void> init() async {
    //_box = await Hive.openBox<HiveRecipe>(_boxName);
  }

  // 4. Provide a getter for the listenable.
  ValueListenable<Box<HiveRecipe>> get listenable => _box.listenable();

  // 5. Use more descriptive method names.
  Future<void> add(HiveRecipe recipe) async {
    await _box.add(recipe);
  }

  List<HiveRecipe> read() {
    return _box.values.toList();
  }

  // 9. Use more descriptive method names.
  Future<void> delete(int index) async {
    await _box.deleteAt(index);
  }

  // 10. Use more descriptive method names.
  Future<void> deleteAll() async {
    // 11. Use clear() instead of deleteFromDisk() for deleting all entries.
    await _box.clear();
  }
}
