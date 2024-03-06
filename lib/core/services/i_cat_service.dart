import 'package:pragma/core/models/cat.dart';

abstract class ICatService {
  Future<List<Cat>> getAll();
  Future<String> getImage({required String referenceImageId});
}