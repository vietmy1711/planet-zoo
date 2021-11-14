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
    }
  }

  Stream<SearchState> _mapSearchInitializedToState(
      SearchInitialized event) async* {
    yield state.copyWith(status: SearchStatus.loading);
    try {
      final results = await apiProvider.getAllAnimals();
      final classes = await apiProvider.getAllAnimalClasses();
      yield state.copyWith(
          status: SearchStatus.success, results: results, classes: classes);
    } catch (e) {
      yield state.copyWith(status: SearchStatus.failed);
    }
  }

  Stream<SearchState> _mapSearchStartedToState(SearchStarted event) async* {
    yield state.copyWith(status: SearchStatus.loading);
    try {
      await Future.delayed(const Duration(seconds: 1));
      yield state.copyWith(status: SearchStatus.success, results: [
        const Animal(
          animalId: 1,
          animalClassId: 'Mammalia',
          genus: 'Orycteropus',
          englishName: 'Aardvark',
          scientificName: 'Orycteropus afer',
          conservationStatus: 'conservationStatus',
          description:
              'The aardvark  is a medium-sized, burrowing, nocturnal mammal native to Africa. It is the only living species of the order Tubulidentata, although other prehistoric species and genera of Tubulidentata are known. Unlike most other insectivores, it has a long pig-like snout, which is used to sniff out food. It roams over most of the southern two-thirds of the African continent, avoiding areas that are mainly rocky. A nocturnal feeder, it subsists on ants and termites, which it will dig out of their hills using its sharp claws and powerful legs. It also digs to create burrows in which to live and rear its young. It receives a least concern rating from the IUCN, although its numbers seem to be decreasing. Aardvarks are afrotheres, a clade which also includes elephants, manatees, and hyraxes.',
          locations: 'Africa',
          lifestyle: 'Nocturnal',
          habitat: 'Sandy and clay soi',
          color: 'Brown, Grey, Yellow',
          lifespan: '23 years',
          animalWeight: '60kg - 80kg (130lbs - 180lbs)',
          animalHeight: 'N/A',
          animalLength: '1.05m - 2.20m (3.4ft - 7.3ft)',
          ageOfSexualMaturity: '2 years',
          ageOfWeaning: '3 months',
          images:
              'https://a-z-animals.com/media/animals/images/original/aardvark-400x300.jpg',
        )
      ]);
    } catch (e) {
      yield state.copyWith(status: SearchStatus.failed);
    }
  }

  Stream<SearchState> _mapSearchByClassNameToState(
      SearchWithClassNameStarted event) async* {
    yield state.copyWith(status: SearchStatus.loading);
    try {
      final results = await apiProvider.getAllAnimalByClass(event.className);
      yield state.copyWith(status: SearchStatus.success, results: results);
    } catch (e) {
      yield state.copyWith(status: SearchStatus.failed);
    }
  }
}
