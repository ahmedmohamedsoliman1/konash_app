import 'package:flutter/material.dart';
import 'package:konash_app/config/app_provider.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
      child: MyApp()));
}


