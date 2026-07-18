import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    super.initState();

    // Load saved favorites
    Future.microtask(() {
      if (!mounted) return;
      context.read<FavoriteProvider>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<FavoriteProvider>();

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Favorite Ayahs"),
      ),

      body: provider.favorites.isEmpty
          ? const Center(
        child: Text("No favorites yet"),
      )
          : ListView.builder(
        itemCount: provider.favorites.length,

        itemBuilder: (context, index) {

          final item = provider.favorites[index];

          return Card(
            margin: const EdgeInsets.all(10),

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Text(
                        "${item.surahName} : ${item.ayahNumber}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () {
                          provider.deleteFavorite(index);
                        },
                      ),

                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    item.arabic,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    item.english,
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