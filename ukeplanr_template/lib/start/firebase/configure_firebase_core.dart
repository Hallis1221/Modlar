import 'package:firebase_core/firebase_core.dart';

Future<void> configureFirebaseCore() async {
  await Firebase.initializeApp();
}
