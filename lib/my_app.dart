import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/config/app_prefs.dart';
import 'package:konash_app/config/app_provider.dart';
import 'package:konash_app/config/user_provider.dart';
import 'package:konash_app/features/creditBook/presentation/screens/create_new_customer.dart';
import 'package:konash_app/features/login/presentation/login_screen.dart';
import 'package:konash_app/features/login/presentation/otp_screen.dart';
import 'package:konash_app/features/major/presentation/major_screen.dart';
import 'package:konash_app/features/page_view_splash/page_view_splash.dart';
import 'package:konash_app/features/splash/presentation/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/app_theme.dart';
import 'features/choice_locale/choice_locale_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/creditBook/presentation/screens/add_customer.dart';
import 'features/more/presentation/screens/business_card_screen.dart';

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
        ChoiceLocaleScreen.routeName : (context) => ChoiceLocaleScreen(),
        PageViewSplash.routeName : (context) => PageViewSplash(),
        MajorScreen.routeName : (context) => MajorScreen(),
        OTPScreen.routeName : (context) => OTPScreen() ,
        BusinessCardScreen.routeName : (context) => BusinessCardScreen (),
        ChoiceCreateOrImportCustomerScreen.routeName : (context) => ChoiceCreateOrImportCustomerScreen(),
        CreateNewCustomer.routeName : (context) => CreateNewCustomer(),
      },
      locale: Locale(provider.appLan) ,
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

}
