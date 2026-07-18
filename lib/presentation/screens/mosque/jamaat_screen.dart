import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/mosque_jamaat_model.dart';
import '../../../providers/jamaat_provider.dart';

class JamaatScreen extends StatelessWidget {
  const JamaatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<JamaatProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mosque Jamaat"),
        backgroundColor: Colors.green,
      ),
      body: provider.jamaats.isEmpty
          ? const Center(
        child: Text(
          "No Mosque Added",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: provider.jamaats.length,
        itemBuilder: (context, index) {
          final jamaat = provider.jamaats[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jamaat.mosqueName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fajr : ${jamaat.fajr}"),
                      Text("Dhuhr : ${jamaat.dhuhr}"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Asr : ${jamaat.asr}"),
                      Text("Maghrib : ${jamaat.maghrib}"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text("Isha : ${jamaat.isha}"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // --- Edit Button ---
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          final mosqueController = TextEditingController(text: jamaat.mosqueName);
                          final fajrController = TextEditingController(text: jamaat.fajr);
                          final dhuhrController = TextEditingController(text: jamaat.dhuhr);
                          final asrController = TextEditingController(text: jamaat.asr);
                          final maghribController = TextEditingController(text: jamaat.maghrib);
                          final ishaController = TextEditingController(text: jamaat.isha);

                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Edit Mosque Jamaat"),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: mosqueController,
                                      decoration: const InputDecoration(
                                        labelText: "Mosque Name",
                                      ),
                                    ),
                                    TextField(
                                      controller: fajrController,
                                      decoration: const InputDecoration(
                                        labelText: "Fajr",
                                      ),
                                    ),
                                    TextField(
                                      controller: dhuhrController,
                                      decoration: const InputDecoration(
                                        labelText: "Dhuhr",
                                      ),
                                    ),
                                    TextField(
                                      controller: asrController,
                                      decoration: const InputDecoration(
                                        labelText: "Asr",
                                      ),
                                    ),
                                    TextField(
                                      controller: maghribController,
                                      decoration: const InputDecoration(
                                        labelText: "Maghrib",
                                      ),
                                    ),
                                    TextField(
                                      controller: ishaController,
                                      decoration: const InputDecoration(
                                        labelText: "Isha",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    await provider.updateJamaat(
                                      index,
                                      MosqueJamaatModel(
                                        mosqueName: mosqueController.text,
                                        fajr: fajrController.text,
                                        dhuhr: dhuhrController.text,
                                        asr: asrController.text,
                                        maghrib: maghribController.text,
                                        isha: ishaController.text,
                                      ),
                                    );
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text("Update"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      // --- Delete Button ---
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          provider.deleteJamaat(index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () {
          final mosqueController = TextEditingController();
          final fajrController = TextEditingController();
          final dhuhrController = TextEditingController();
          final asrController = TextEditingController();
          final maghribController = TextEditingController();
          final ishaController = TextEditingController();

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Add Mosque Jamaat"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: mosqueController,
                      decoration: const InputDecoration(
                        labelText: "Mosque Name",
                      ),
                    ),
                    TextField(
                      controller: fajrController,
                      decoration: const InputDecoration(
                        labelText: "Fajr",
                      ),
                    ),
                    TextField(
                      controller: dhuhrController,
                      decoration: const InputDecoration(
                        labelText: "Dhuhr",
                      ),
                    ),
                    TextField(
                      controller: asrController,
                      decoration: const InputDecoration(
                        labelText: "Asr",
                      ),
                    ),
                    TextField(
                      controller: maghribController,
                      decoration: const InputDecoration(
                        labelText: "Maghrib",
                      ),
                    ),
                    TextField(
                      controller: ishaController,
                      decoration: const InputDecoration(
                        labelText: "Isha",
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await provider.addJamaat(
                      MosqueJamaatModel(
                        mosqueName: mosqueController.text,
                        fajr: fajrController.text,
                        dhuhr: dhuhrController.text,
                        asr: asrController.text,
                        maghrib: maghribController.text,
                        isha: ishaController.text,
                      ),
                    );
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}