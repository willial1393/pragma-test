import 'package:flutter/material.dart';
import 'package:pragma/core/models/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({required this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(cat.name ?? ''),
        ],
      ),

    );
  }
}
