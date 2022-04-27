import 'package:casino_test/src/data/models/character.dart';
import 'package:casino_test/src/data/repository/characters_repository.dart';
import 'package:casino_test/src/presentation/bloc/main_event.dart';
import 'package:casino_test/src/presentation/bloc/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CharactersRepository charactersRepository;

  MainPageBloc({
    required this.charactersRepository,
  }) : super(LoadingMainPageState()) {
    on<GetTestDataOnMainPageEvent>(
      (event, emitter) async => await _getDataOnMainPageCasino(event, emitter),
    );
    on<LoadingDataOnMainPageEvent>(
      (event, emitter) => emitter(LoadingMainPageState()),
    );
  }

  Future<void> _dataLoadedOnMainPageCasino(
    Emitter<MainPageState> emit,
    CharactersResponseModel? data,
  ) async {
    if (data != null) {
      emit(SuccessfulMainPageState(data));
    } else {
      emit(UnSuccessfulMainPageState());
    }
  }

  Future<void> _getDataOnMainPageCasino(
    GetTestDataOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    try {
      final response = await charactersRepository.getCharacters(event.page);
      _dataLoadedOnMainPageCasino(emit, response);
    } catch (err) {
      emit(UnSuccessfulMainPageState());
    }
  }
}
