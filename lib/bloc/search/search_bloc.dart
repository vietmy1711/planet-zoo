import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:planet_zoo/models/animal/animal.dart';
import 'package:planet_zoo/models/animal_class/animal_class.dart';

import '../../apis/api_provider.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiProvider apiProvider;

  SearchBloc({required this.apiProvider}) : super(const SearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchInitialized) {
      yield* _mapSearchInitializedToState(event);
    } else if (event is SearchStarted) {
      yield* _mapSearchStartedToState(event);
    } else if (event is SearchWithClassNameStarted) {
      yield* _mapSearchByClassNameToState(event);
    } else if (event is QrCodeScanned) {
      yield* _mapQrCodeScannedToState(event);
    }
  }

  Stream<SearchState> _mapSearchInitializedToState(
      SearchInitialized event) async* {
    yield state.copyWith(status: SearchStatus.loading);
    try {
      final results = await apiProvider.getAllAnimals();
      final classes = await apiProvider.getAllAnimalClasses();
      yield state.copyWith(
          status: SearchStatus.success,
          results: results,
          showResults: results,
          classes: classes);
    } catch (e) {
      yield state.copyWith(status: SearchStatus.failed);
    }
  }

  Stream<SearchState> _mapSearchStartedToState(SearchStarted event) async* {
    if (state.status == SearchStatus.loading) return;
    yield state.copyWith(status: SearchStatus.loading);
    try {
      final showResults = (state.results ?? [])
          .where((element) => (element.englishName ?? '')
              .toLowerCase()
              .contains((event.string ?? '').toLowerCase()))
          .toList();
      yield state.copyWith(
          status: SearchStatus.success, showResults: showResults);
    } catch (e) {
      yield state.copyWith(status: SearchStatus.failed);
    }
  }

  Stream<SearchState> _mapSearchByClassNameToState(
      SearchWithClassNameStarted event) async* {
    yield state.copyWith(status: SearchStatus.loading);
    try {
      final results = await apiProvider.getAllAnimalByClass(event.className);
      yield state.copyWith(
          status: SearchStatus.success, results: results, showResults: results);
    } catch (e) {
      yield state.copyWith(status: SearchStatus.failed);
    }
  }

  Stream<SearchState> _mapQrCodeScannedToState(QrCodeScanned event) async* {
    yield state.copyWith(status: SearchStatus.loading);
    try {
      final animal = await apiProvider.getAnimalById(event.id);
      yield state.copyWith(status: SearchStatus.qrCodeSuccess, animal: animal);
    } catch (e) {
      yield state.copyWith(status: SearchStatus.qrCodeFailed);
    }
  }
}
