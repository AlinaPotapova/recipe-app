import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/domain/entities/recipe/hive_recipe.dart'; // Import your HiveRecipe class
import 'package:recipe_app/presentation/views/home.dart';
import 'package:recipe_app/utils/app_bindings.dart';
import 'package:recipe_app/utils/firebase_messaging_setup.dart';
import 'firebase_options.dart';

// check, if this is needed

/*@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}*/

//GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, name: 'recipe-app');

  await _initHive();

  AppBindings().setup();

  await setupFirebaseMessaging();
  // TODO: Remove this line after sending the first sample event to sentry.
  //await Sentry.captureFeedback(feedback)captureException(StateError('This is a sample exception.'));
}

Future<void> request() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveRecipeAdapter());
  await Hive.openBox<HiveRecipe>('recipeBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
