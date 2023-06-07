import 'package:flutter/material.dart';
import 'package:konash_app/config/app_provider.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
      child: MyApp()));
}


