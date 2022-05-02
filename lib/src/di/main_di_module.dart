import 'package:casino_test/src/data/repository/characters_repository.dart';
import 'package:casino_test/src/data/repository/characters_repository_impl.dart';
import 'package:casino_test/src/presentation/bloc/main_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final di = GetIt.instance;

class MainDIModule {
  void configure(GetIt getIt) {
    final httpClient = Client();

    di.registerLazySingleton<CharactersRepository>(
        () => CharactersRepositoryImpl(httpClient));

    di.registerLazySingleton(() => MainPageBloc(charactersRepository: di()));
  }
}
