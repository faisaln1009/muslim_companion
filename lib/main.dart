import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/mosque_jamaat_model.dart';

import 'providers/theme_provider.dart';
import 'providers/prayer_provider.dart';
import 'providers/quran_provider.dart';
import 'providers/surah_provider.dart';
import 'providers/mosque_provider.dart';
import 'providers/favorite_provider.dart';
import 'providers/jamaat_provider.dart';

import 'presentation/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register Hive Adapter
  Hive.registerAdapter(
    MosqueJamaatModelAdapter(),
  );

  // Open Hive Boxes
  await Hive.openBox("favorites");

  await Hive.openBox("settings");

  await Hive.openBox<MosqueJamaatModel>(
    "jamaatBox",
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => PrayerProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => QuranProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => SurahProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => MosqueProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => JamaatProvider(),
        ),
      ],
      child: const MuslimCompanionApp(),
    ),
  );
}

class MuslimCompanionApp extends StatelessWidget {
  const MuslimCompanionApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider =
    context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Islamic Companion",

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),

      themeMode: themeProvider.themeMode,

      home: const SplashScreen(),
    );
  }
}