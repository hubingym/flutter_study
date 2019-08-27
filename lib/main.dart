import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';
import 'i10n/localization_intl.dart';
import 'pages/index.dart';
import 'states/index.dart';
import 'utils/index.dart';

void main() async {
  await Utils.initSystem();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GlobalState()),
      ],
      child: Consumer<GlobalState>(
        builder: (BuildContext context, GlobalState globalState, Widget child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: globalState.theme,
            ),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              const AppLocalizationsDelegate(),
            ],
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('zh', 'CN'),
            ],
            localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
              if (globalState.locale.isNotEmpty) {
                return globalState.getLocale();
              }
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
        },
      ),
    );
  }
}
