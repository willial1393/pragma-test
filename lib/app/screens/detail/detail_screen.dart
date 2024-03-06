import 'package:flutter/material.dart';
import 'package:pragma/app/screens/detail/widgets/detail_text.dart';
import 'package:pragma/app/widgets/cat_image.dart';
import 'package:pragma/core/models/cat.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;
  final String? imageUrl;

  const DetailScreen({required this.cat, super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CatImage(
                referenceImageId: cat.referenceImageId,
                imageUrl: imageUrl,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(cat.description ?? ''),
                    const SizedBox(height: 16.0),
                    DetailText(
                      text: 'País',
                      value: cat.origin,
                    ),
                    DetailText(
                      text: 'Peso',
                      value: cat.weight?.metric,
                    ),
                    DetailText(
                      text: 'Vida',
                      value: cat.lifeSpan,
                    ),
                    DetailText(
                      text: 'Adaptabilidad',
                      value: cat.adaptability,
                    ),
                    DetailText(
                      text: 'Nivel de afecto',
                      value: cat.affectionLevel,
                    ),
                    DetailText(
                      text: 'Amistoso (Niños)',
                      value: cat.childFriendly,
                    ),
                    DetailText(
                      text: 'Amistoso (Perros)',
                      value: cat.dogFriendly,
                    ),
                    DetailText(
                      text: 'Amistoso (Extraños)',
                      value: cat.strangerFriendly,
                    ),
                    DetailText(
                      text: 'Nivel de energía',
                      value: cat.energyLevel,
                    ),
                    DetailText(
                      text: 'Aseo',
                      value: cat.grooming,
                    ),
                    DetailText(
                      text: 'Problemas de salud',
                      value: cat.healthIssues,
                    ),
                    DetailText(
                      text: 'Inteligencia',
                      value: cat.intelligence,
                    ),
                    DetailText(
                      text: 'Livel de muda',
                      value: cat.sheddingLevel,
                    ),
                    DetailText(
                      text: 'Necesidad social',
                      value: cat.socialNeeds,
                    ),
                    DetailText(
                      text: 'Temperamento',
                      value: cat.temperament,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
