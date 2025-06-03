import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/domain/entities/recipe/hive_recipe.dart';

class HiveService {
  // 1. Use a static constant for the box name.
  static const String _boxName = "recipeBox";

  // 2. Initialize the box in a static method and use a late final variable.
  static final Box<HiveRecipe> _box = Hive.box("recipeBox");

  // 3. Initialize the box asynchronously.
  static Future<void> init() async {
    //_box = await Hive.openBox<HiveRecipe>(_boxName);
  }

  // 4. Provide a getter for the listenable.
  ValueListenable<Box<HiveRecipe>> get listenable => _box.listenable();

  // 5. Use more descriptive method names.
  Future<void> add(HiveRecipe recipe) async {
    // 6. No need to create a local variable for the box.
    await _box.add(recipe);
  }

  // 7. Use a more specific return type.
  List<HiveRecipe> read() {
    // 8. Use type casting for clarity.
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
