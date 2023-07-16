import 'package:ballabash/app/data/firebase/firebase_config.dart';
import 'package:ballabash/app/presentation/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseConfig.options);
  await setup();
  runApp(const App());
}
