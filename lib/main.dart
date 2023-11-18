import 'package:clothes_store/controlers/languse/languge_cubit.dart';
import 'package:clothes_store/presentation/views/mainscreens/NavBar.dart';
import 'package:clothes_store/presentation/views/onBoarding/onBoarding.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MainApp(prefs));
}

class MainApp extends StatelessWidget {
  final SharedPreferences prefs;

  MainApp(this.prefs);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = prefs.getBool('isSwitched') ?? false;

    TextStyle textStyle = isSwitched ?  GoogleFonts.dmSans():GoogleFonts.notoKufiArabic() ;

    return BlocProvider(
      create: (context) => LanguageCubit(prefs),
      child:
          BlocBuilder<LanguageCubit, LanguageState>(builder: (context, locale) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: textStyle.fontFamily,
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale.locale,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', 'AR'),
            // Add other supported locales
          ],
          home: FutureBuilder<bool>(
            future: SharedPreferences.getInstance()
                .then((prefs) => prefs.getBool('isLogin') ?? false),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return Navigation_Bar();
                } else {
                  return OnBoard();
                }
              }
              return CircularProgressIndicator(); // You may want to show a loading indicator while checking login status.
            },
          ),
        );
      }),
    );
  }
}
