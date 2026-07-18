import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MosqueBoardScanner extends StatefulWidget {
  const MosqueBoardScanner({super.key});

  @override
  State<MosqueBoardScanner> createState() =>
      _MosqueBoardScannerState();
}

class _MosqueBoardScannerState
    extends State<MosqueBoardScanner> {

  File? image;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (picked == null) return;

    setState(() {
      image = File(picked.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Mosque Board"),
      ),

      body: Center(
        child: image == null
            ? const Text("No Image")
            : Image.file(image!),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}