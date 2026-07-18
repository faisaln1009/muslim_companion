import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/surah_provider.dart';
import '../../../providers/favorite_provider.dart';

import '../../../data/models/favorite_model.dart';

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      context.read<SurahProvider>().loadAyahs(widget.surahNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SurahProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.surahName),
      ),
      body: provider.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: provider.ayahs.length,
        itemBuilder: (context, index) {
          final ayah = provider.ayahs[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${ayah.number}.",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context
                              .read<FavoriteProvider>()
                              .addFavorite(
                            FavoriteModel(
                              surahNumber: widget.surahNumber,
                              ayahNumber: ayah.number,
                              surahName: widget.surahName,
                              arabic: ayah.arabic,
                              english: ayah.english,
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                              Text("Added to Favorites ❤️"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    ayah.arabic,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    ayah.english,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}