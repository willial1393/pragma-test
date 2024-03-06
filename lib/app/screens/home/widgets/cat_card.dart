import 'package:flutter/material.dart';
import 'package:pragma/app/screens/detail/detail_screen.dart';
import 'package:pragma/app/widgets/cat_image.dart';
import 'package:pragma/core/models/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({required this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(cat: cat, imageUrl: imageUrl),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cat.name ?? ''),
                  const Text('Más...'),
                ],
              ),
            ),
            CatImage(
              referenceImageId: cat.referenceImageId,
              imageUrl: imageUrl,
              onImageUrlLoaded: (value) {
                imageUrl = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cat.origin ?? ''),
                  Text('Inteligencia: ${cat.intelligence}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
