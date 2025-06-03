import 'package:hive/hive.dart';

part 'hive_recipe.g.dart';

@HiveType(typeId: 0)
class HiveRecipe {
  @HiveField(0)
  late String? id;

  @HiveField(1)
  late String? photoUrl;

  @HiveField(2)
  late String? name;

  @HiveField(3)
  late bool? isFavorite;

  HiveRecipe({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.isFavorite,
  });
}
