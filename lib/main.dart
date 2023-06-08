import 'package:flutter/material.dart';
import 'package:konash_app/config/app_provider.dart';
import 'package:konash_app/config/user_provider.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
          providers: [
      ChangeNotifierProvider(
      create: (context) => AppProvider(),
      ), ChangeNotifierProvider(
              create: (context) => UserProvider(),
            ),
          ],
          child: MyApp()));
}


