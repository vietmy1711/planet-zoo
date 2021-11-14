part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class SearchInitialized extends SearchEvent {
  const SearchInitialized();

  @override
  List<Object?> get props => [];
}

class SearchStarted extends SearchEvent {
  final String? string;

  const SearchStarted({required this.string});

  @override
  List<Object?> get props => [string];
}

class SearchWithClassNameStarted extends SearchEvent {
  final String className;

  const SearchWithClassNameStarted({required this.className});

  @override
  List<Object?> get props => [className];
}

class SearchWithIdStarted extends SearchEvent {
  final int id;

  const SearchWithIdStarted({required this.id});

  @override
  List<Object?> get props => [id];
}
