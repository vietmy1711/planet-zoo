part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Animal>? results;
  final List<AnimalClass>? classes;
  final SearchStatus? status;

  const SearchState({this.results, this.status, this.classes});

  @override
  List<Object?> get props => [
        results,
        status,
        classes,
      ];

  SearchState copyWith({
    List<Animal>? results,
    SearchStatus? status,
    List<AnimalClass>? classes,
  }) {
    return SearchState(
      results: results ?? this.results,
      status: status ?? this.status,
      classes: classes ?? this.classes,
    );
  }
}

enum SearchStatus {
  loading,
  success,
  failed,
}
