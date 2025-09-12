import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/recipe/firebase_repository.dart';
import '../data/repositories/recipe/recipe_repository.dart';
import '../data/services/auth_service.dart';
import '../data/services/hive_service.dart';
import 'camera_setup.dart';
import 'sentry_setup.dart';

class AppBindings {
  AppBindings();

  Future<void> setup() async {
    _setupGetIt();
    CameraSetup().setup();
    SentrySetup().setup();
  }
}

//or
/*uture<void> setup() async {
  await _setupCamera();
  await _setupSentry();
  _setupGetIt();
}

Future<void> _setupCamera() async {
  await CameraSetup().setup();
}

Future<void> _setupSentry() async {
  await SentrySetup().setup();
}*/

//GetIt
final getIt = GetIt.instance;

void _setupGetIt() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerSingleton<HiveService>(HiveService(), signalsReady: true);
  getIt.registerSingleton<AppGlobals>(AppGlobals());
  getIt.registerLazySingleton<RecipeRepository>(() => FirebaseRepository());
}

class AppGlobals {
  List<CameraDescription> cameras = [];
}
