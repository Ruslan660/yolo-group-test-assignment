// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponseModel _$CharactersResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharactersResponseModel(
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      characters: (json['results'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersResponseModelToJson(
        CharactersResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.characters,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'next': instance.next,
      'prev': instance.prev,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      name: json['name'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null
          ? null
          : Origin.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
    };

Origin _$OriginFromJson(Map<String, dynamic> json) => Origin(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$OriginToJson(Origin instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
