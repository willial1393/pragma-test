import 'package:injectable/injectable.dart';
import 'package:pragma/core/models/cat.dart';
import 'package:pragma/core/services/i_cat_service.dart';
import 'package:pragma/data/sources/the_cat_api.dart';

@Injectable(as: ICatService)
class CatService implements ICatService {
  final TheCatApi catApi;

  CatService(this.catApi);

  @override
  Future<List<Cat>> getAll() async {
    final res = await catApi.get('/v1/breeds');
    List<Cat> cats = [];
    for (final cat in res) {
      cats.add(Cat.fromJson(cat));
    }
    return cats;
  }

  @override
  Future<String> getImage({required String referenceImageId}) async {
    final res = await catApi.get('/v1/images/$referenceImageId');
    return res['url'];
  }
}
