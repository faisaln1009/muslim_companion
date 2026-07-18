import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/prayer_provider.dart';
import '../favorite/favorite_screen.dart';
import '../mosque/mosque_screen.dart';
import '../prayer/prayer_screen.dart';
import '../qibla/qibla_screen.dart';
import '../quran/quran_screen.dart';
import '../settings/settings_screen.dart';
import '../mosque/jamaat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    debugPrint("Home Screen Opened");


    Future.microtask(() {

      if (!mounted) return;


      debugPrint("Home Calling Prayer Provider");


      context
          .read<PrayerProvider>()
          .loadPrayerTimes();

    });

  }



  @override
  Widget build(BuildContext context) {
    final prayerProvider = context.watch<PrayerProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Islamic Companion",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assalamu Alaikum",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: .8),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Welcome to Islamic Companion",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (prayerProvider.prayerModel != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        prayerInfo(
                          "Fajr",
                          prayerProvider.prayerModel!.fajr,
                        ),
                        prayerInfo(
                          "Dhuhr",
                          prayerProvider.prayerModel!.dhuhr,
                        ),
                        prayerInfo(
                          "Maghrib",
                          prayerProvider.prayerModel!.maghrib,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1,
              children: [
                buildCard(
                  context,
                  Icons.access_time,
                  "Prayer",
                  Colors.green,
                  const PrayerScreen(),
                ),
                buildCard(
                  context,
                  Icons.menu_book,
                  "Quran",
                  Colors.orange,
                  const QuranScreen(),
                ),
                buildCard(
                  context,
                  Icons.explore,
                  "Qibla",
                  Colors.blue,
                  const QiblaScreen(),
                ),
                buildCard(
                  context,
                  Icons.location_on,
                  "Mosques",
                  Colors.red,
                  const MosqueScreen(),
                ),
                buildCard(
                  context,
                  Icons.favorite,
                  "Favorites",
                  Colors.pink,
                  const FavoriteScreen(),
                ),
                buildCard(
                  context,
                  Icons.settings,
                  "Settings",
                  Colors.deepPurple,
                  const SettingsScreen(),
                ),
                buildCard(
                  context,
                  Icons.access_time_filled,
                  "Jamaat",
                  Colors.teal,
                  const JamaatScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Menu card
  Widget buildCard(
      BuildContext context,
      IconData icon,
      String title,
      Color color,
      Widget screen,
      ) {
    return Card(
      elevation: 4,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => screen,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Prayer info
  Widget prayerInfo(String title, String time) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
