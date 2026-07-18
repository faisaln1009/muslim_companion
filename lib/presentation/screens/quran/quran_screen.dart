import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/quran_provider.dart';
import '../detail/surah_detail_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  @override
  void initState() {
    super.initState();

    // Load surah list
    Future.microtask(() {
      if (!mounted) return;
      context.read<QuranProvider>().loadSurahs();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<QuranProvider>();

    return Scaffold(

      appBar: AppBar(
        title: const Text("Al Quran"),
        backgroundColor: Colors.green,
      ),

      body: provider.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )

          : ListView.builder(
        itemCount: provider.surahs.length,

        itemBuilder: (context, index) {

          final surah = provider.surahs[index];

          return ListTile(

            // Open details
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SurahDetailScreen(
                    surahNumber: surah.number,
                    surahName: surah.englishName,
                  ),
                ),
              );
            },

            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                surah.number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            title: Text(
              surah.englishName,
            ),

            subtitle: Text(
              surah.name,
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          );
        },
      ),
    );
  }
}