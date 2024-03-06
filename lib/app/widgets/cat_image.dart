import 'package:flutter/material.dart';
import 'package:pragma/core/services/i_cat_service.dart';
import 'package:pragma/injection.dart';

class CatImage extends StatelessWidget {
  final String? referenceImageId;

  const CatImage({super.key, this.referenceImageId});

  @override
  Widget build(BuildContext context) {
    if (referenceImageId == null) {
      return const AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Text('Imagen no disponible'),
        ),
      );
    }
    final ICatService catService = getIt();
    return AspectRatio(
      aspectRatio: 1,
      child: FutureBuilder<String>(
        future: catService.getImage(
          referenceImageId: referenceImageId!,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error al cargar la imagen'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
