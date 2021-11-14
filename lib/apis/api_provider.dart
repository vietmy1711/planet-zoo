import 'package:dio/dio.dart';
import 'package:planet_zoo/models/animal/animal.dart';
import 'package:planet_zoo/models/animal_class/animal_class.dart';

class ApiProvider {
  final Dio dioHttpClient;

  static ApiProvider? _instance;

  // ignore: constant_identifier_names
  static const API_BASE_URL = 'https://planet-zoo.herokuapp.com/api';

  ApiProvider._internal({required this.dioHttpClient});

  static ApiProvider getInstance({required Dio dioHttpClient}) {
    _instance ??= ApiProvider._internal(
      dioHttpClient: dioHttpClient,
    );
    return _instance!;
  }

  Future<List<Animal>> getAllAnimals() async {
    final response = await dioHttpClient.get(
      '$API_BASE_URL/planetzoo/animals/',
    );
    final animals =
        List.from(response.data).map((e) => Animal.fromJson(e)).toList();
    return animals;
  }

  Future<List<Animal>> getAllAnimalByClass(String className) async {
    final response = await dioHttpClient.get(
      '$API_BASE_URL/planetzoo/animals/classname/$className',
    );
    final animals =
        List.from(response.data).map((e) => Animal.fromJson(e)).toList();
    return animals;
  }

  Future<List<Animal>> getAllAnimalById(int id) async {
    final response = await dioHttpClient.get(
      '$API_BASE_URL/planetzoo/animals/$id',
    );
    final animals =
        List.from(response.data).map((e) => Animal.fromJson(e)).toList();
    return animals;
  }

  Future<List<AnimalClass>> getAllAnimalClasses() async {
    final response = await dioHttpClient.get(
      '$API_BASE_URL/animalclass/',
    );
    final classes =
        List.from(response.data).map((e) => AnimalClass.fromJson(e)).toList();
    return classes;
  }
}
