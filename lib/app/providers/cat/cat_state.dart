import 'package:pragma/core/models/cat.dart';

class CatState {
  final bool loading;
  final bool error;
  final List<Cat> cats;
  final List<Cat> catsFiltered;
  final String searchValue;

  const CatState({
    this.loading = false,
    this.error = false,
    this.cats = const [],
    this.catsFiltered = const [],
    this.searchValue = '',
  });

  CatState copyWith({
    bool? loading,
    bool? error,
    List<Cat>? cats,
    List<Cat>? catsFiltered,
    String? searchValue,
  }) {
    return CatState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      cats: cats ?? this.cats,
      catsFiltered: catsFiltered ?? this.catsFiltered,
      searchValue: searchValue ?? this.searchValue,
    );
  }
}
