import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class CharactersResponseModel {
  final Info? info;

  @JsonKey(name: 'results')
  final List<Character>? characters;

  CharactersResponseModel({
    this.info,
    this.characters,
  });

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseModelToJson(this);
}

@JsonSerializable()
class Info {
  final String? next, prev;

  Info({
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Character {
  final String? name, image, status, species, type, gender;
  final Origin? origin;
  final Location? location;

  Character(
      {required this.name,
      required this.image,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Origin {
  final String? name, url;

  Origin({
    required this.name,
    required this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Location {
  final String? name, url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
