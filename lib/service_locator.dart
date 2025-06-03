import 'package:get_it/get_it.dart';

import 'data/repositiries/db_repository.dart';
import 'data/services/hive_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DbConnection>(() => FirebaseRepository());
  getIt.registerSingleton<HiveService>(HiveService(), signalsReady: true);
  getIt.registerLazySingleton<DbConnection>(
    () => FirebaseRepository(),
  );
}
