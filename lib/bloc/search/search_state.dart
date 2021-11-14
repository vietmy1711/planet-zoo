part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Animal>? results;
  final List<Animal>? showResults;
  final List<AnimalClass>? classes;
  final SearchStatus? status;
  final Animal? animal;
  const SearchState({
    this.results,
    this.showResults,
    this.status,
    this.classes,
    this.animal,
  });

  @override
  List<Object?> get props => [
        results,
        showResults,
        status,
        classes,
        animal,
      ];

  SearchState copyWith({
    List<Animal>? results,
    List<Animal>? showResults,
    SearchStatus? status,
    List<AnimalClass>? classes,
    Animal? animal,
  }) {
    return SearchState(
      results: results ?? this.results,
      showResults: showResults ?? this.showResults,
      status: status ?? this.status,
      classes: classes ?? this.classes,
      animal: animal ?? this.animal,
    );
  }
}

enum SearchStatus {
  loading,
  success,
  failed,
  qrCodeSuccess,
  qrCodeFailed,
}
