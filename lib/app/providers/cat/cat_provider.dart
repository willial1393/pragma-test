import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma/app/providers/cat/cat_state.dart';
import 'package:pragma/core/services/i_cat_service.dart';
import 'package:pragma/injection.dart';

class CatNotifier extends StateNotifier<CatState> {
  final ICatService catService;

  CatNotifier({required this.catService}) : super(const CatState());

  Future<void> fetchAll() async {
    state = state.copyWith(loading: true, error: false);
    try {
      final cats = await catService.getAll();
      state = state.copyWith(
        loading: false,
        error: false,
        cats: cats,
        catsFiltered: cats,
      );
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(loading: false, error: true);
    }
  }

  void search(String value) {
    state = state.copyWith(
      searchValue: value,
      catsFiltered: value.isEmpty
          ? state.cats
          : state.cats
              .where(
                (cat) =>
                    cat.name
                        ?.trim()
                        .toLowerCase()
                        .contains(value.trim().toLowerCase()) ??
                    false,
              )
              .toList(),
    );
  }
}

final catProvider = StateNotifierProvider<CatNotifier, CatState>((ref) {
  return CatNotifier(
    catService: getIt(),
  );
});
