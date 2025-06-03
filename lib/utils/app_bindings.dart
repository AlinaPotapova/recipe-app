import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../data/services/auth_service.dart';
import '../data/services/hive_service.dart';
import '../main.dart';

class AppBindings {
  void setup() {
    setupCameras();
    setupSentry();
    setupGetIt();
  }

  //// Camera
  void setupCameras() async {
    final globals = GetIt.instance<AppGlobals>();
    globals.cameras = await availableCameras();
  }

  //Sentry
  void setupSentry() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://bfb42831ddbad558c073177b1b0fa781@o4509085452206080.ingest.de.sentry.io/4509085456793680';
        options.sendDefaultPii = true;
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(SentryWidget(child: const MyApp())),
    );
  }
}

//GetIt
final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<HiveService>(() => HiveService());

  getIt.registerSingleton<AppGlobals>(AppGlobals());
}

class AppGlobals {
  List<CameraDescription> cameras = [];
}
