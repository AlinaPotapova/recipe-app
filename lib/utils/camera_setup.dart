import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';

import 'app_bindings.dart';

class CameraSetup {
  CameraSetup();

  void setup() async {
    final globals = GetIt.instance<AppGlobals>();
    globals.cameras = await availableCameras();
  }
}
