import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_class.freezed.dart';
part 'animal_class.g.dart';

@freezed
class AnimalClass with _$AnimalClass {
  const factory AnimalClass({
    int? id,
    String? className,
    String? phylumName,
    bool? isActive,
  }) = _AnimalClass;

  factory AnimalClass.fromJson(Map<String, dynamic> json) =>
      _$AnimalClassFromJson(json);
}
