import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/utils/sentry_setup.dart';

import '../data/repositiries/recipe/firebase_repository.dart';
import '../data/repositiries/recipe/recipe_repository.dart';
import '../data/services/auth_service.dart';
import '../data/services/hive_service.dart';
import 'camera_setup.dart';

class AppBindings {
  AppBindings();

  void setup() async {
    CameraSetup().setup();
    SentrySetup().setup();
    setupGetIt();
  }
}

//GetIt
final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerSingleton<HiveService>(HiveService(), signalsReady: true);
  getIt.registerSingleton<AppGlobals>(AppGlobals());
  getIt.registerLazySingleton<RecipeRepository>(() => FirebaseRepository());
  getIt.registerLazySingleton<RecipeRepository>(
    () => FirebaseRepository(),
  );
}

class AppGlobals {
  List<CameraDescription> cameras = [];
}
