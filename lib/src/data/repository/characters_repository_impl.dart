import 'dart:async';
import 'dart:convert';

import 'package:casino_test/src/data/models/character.dart';
import 'package:casino_test/src/data/repository/characters_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final Client client;

  CharactersRepositoryImpl(this.client);

  @override
  Future<CharactersResponseModel?> getCharacters(int page) async {
    try {
      final response = await client.get(
        Uri.parse("https://rickandmortyapi.com/api/character/?page=$page"),
      );
      final responseJson = json.decode(response.body.toString());
      return CharactersResponseModel.fromJson(responseJson);
    } catch (err) {
      rethrow;
    }

  }
}
