import 'package:flutter/material.dart';
import 'package:pragma/core/models/cat.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;
  final String imageUrl;

  const DetailScreen({
    required this.cat,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: const Center(
        child: Text('Detail'),
      ),
    );
  }
}
