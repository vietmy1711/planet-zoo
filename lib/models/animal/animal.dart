import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';
part 'animal.g.dart';

@freezed
class Animal with _$Animal {
  const factory Animal({
    int? animalId,
    String? animalClassId,
    String? genus,
    String? englishName,
    String? scientificName,
    String? conservationStatus,
    String? description,
    String? locations,
    String? lifestyle,
    String? habitat,
    String? color,
    String? lifespan,
    String? animalWeight,
    String? animalHeight,
    String? animalLength,
    String? ageOfSexualMaturity,
    String? ageOfWeaning,
    String? quota,
    String? images,
    bool? isActive,
  }) = _Animal;

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
}
