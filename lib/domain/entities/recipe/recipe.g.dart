// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: json['id'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      instructions: json['instructions'] as String?,
      cookTime: (json['cookTime'] as num?)?.toInt(),
      cuisineType: json['cuisineType'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredients': instance.ingredients,
      'name': instance.name,
      'instructions': instance.instructions,
      'cookTime': instance.cookTime,
      'cuisineType': instance.cuisineType,
      'category': instance.category,
    };
