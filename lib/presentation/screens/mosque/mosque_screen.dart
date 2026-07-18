import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/mosque_provider.dart';

class MosqueScreen extends StatefulWidget {
  const MosqueScreen({super.key});

  @override
  State<MosqueScreen> createState() => _MosqueScreenState();
}

class _MosqueScreenState extends State<MosqueScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      context.read<MosqueProvider>().loadNearbyMosques();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MosqueProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Mosques"),
        backgroundColor: Colors.green,
      ),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(MosqueProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 10),
              Text(provider.errorMessage!, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => provider.loadNearbyMosques(),
                child: const Text("Retry"),
              )
            ],
          ),
        ),
      );
    }

    if (provider.mosques.isEmpty) {
      return const Center(child: Text("No nearby mosque found within 10km."));
    }

    return RefreshIndicator(
      onRefresh: () => provider.loadNearbyMosques(),
      child: ListView.builder(
        itemCount: provider.mosques.length,
        itemBuilder: (context, index) {
          final mosque = provider.mosques[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.mosque, color: Colors.white),
              ),
              title: Text(
                mosque.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mosque.address),
                  const SizedBox(height: 4),
                  Text(
                    "${mosque.distance.toStringAsFixed(2)} km away",
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
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
