import 'package:casino_test/src/data/models/character.dart';

abstract class CharactersRepository {
  Future<CharactersResponseModel?> getCharacters(int page);
}
