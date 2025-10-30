import 'package:flutter/material.dart';
import 'package:pmm_exercise2/screens/alert_page.dart';
import 'package:pmm_exercise2/screens/animated_container.dart';
import 'package:pmm_exercise2/screens/avatar_page.dart';
import 'package:pmm_exercise2/screens/home_page.dart';
import 'package:pmm_exercise2/screens/card_page.dart';
import 'package:pmm_exercise2/screens/input_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pmm_exercise2/screens/listview_page.dart';
import 'package:pmm_exercise2/screens/slider_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'Components',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => Cardpage(),
        'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
        'inputs': (BuildContext context) => InputPage(),
        'slider': (BuildContext context) => SliderPage(),
        'list': (BuildContext context) => LlistaPage()
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],


    );
  }
}
