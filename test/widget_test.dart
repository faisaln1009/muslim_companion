import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:muslim_companion/main.dart';
import 'package:muslim_companion/providers/theme_provider.dart';
import 'package:muslim_companion/providers/prayer_provider.dart';
import 'package:muslim_companion/providers/quran_provider.dart';
import 'package:muslim_companion/presentation/screens/splash/splash_screen.dart';

void main() {
  testWidgets('Muslim Companion Splash Screen Test', (WidgetTester tester) async {
    await tester.pumpWidget(
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
        ],
        child: const MuslimCompanionApp(),
      ),
    );

    // Check Splash Screen exists
    expect(
      find.byType(SplashScreen),
      findsOneWidget,
    );

    // Allow the timer to finish
    await tester.pump(const Duration(seconds: 3));
  });
}
