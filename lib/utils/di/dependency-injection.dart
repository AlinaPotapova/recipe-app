import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/auth/auth_service.dart';
import 'package:recipe_app/data/constant/constant.dart';
import 'package:recipe_app/data/repositories/recipe/firebase_repository.dart';
import 'package:recipe_app/data/repositories/recipe/recipe_repository.dart';
import 'package:recipe_app/data/datasource/hive_recipe_data_source.dart';
import 'package:recipe_app/utils/app_bindings.dart';

final getIt = GetIt.instance;
final dio = Dio(BaseOptions(baseUrl: kBaseUrl));


void setupGetIt() {
  getIt.registerSingleton<Dio>(dio);
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerSingleton<HiveRecipeDataSource>(HiveRecipeDataSource(), signalsReady: true);
  getIt.registerSingleton<AppGlobals>(AppGlobals());
  getIt.registerLazySingleton<RecipeRepository>(() => FirebaseRepository());
}