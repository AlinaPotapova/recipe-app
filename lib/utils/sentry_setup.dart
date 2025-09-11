import 'package:flutter/cupertino.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../main.dart';

class SentrySetup {
  SentrySetup();

  void setup() async {
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
