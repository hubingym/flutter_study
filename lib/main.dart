import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i10n/localization_intl.dart';
import 'pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const AppLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CN'),
      ],
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        if (!supportedLocales.contains(locale)) {
          locale = Locale('en', 'US');
        }
        return locale;
      },
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        'login': (context) => LoginPage(),
        'themes': (context) => ThemePage(),
        'language': (context) => LanguagePage(),
      },
    );
  }
}


