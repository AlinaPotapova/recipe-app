import 'package:camera/camera.dart';

import 'camera_setup.dart';
import 'sentry_setup.dart';

class AppBindings {
  AppBindings();

  Future<void> setup() async {
    CameraSetup().setup();
    SentrySetup().setup();
  }
}

class AppGlobals {
  List<CameraDescription> cameras = [];
}
