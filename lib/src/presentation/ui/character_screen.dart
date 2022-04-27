import 'package:casino_test/src/data/models/character.dart';
import 'package:casino_test/src/di/main_di_module.dart';
import 'package:casino_test/src/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/presentation/bloc/main_event.dart';
import 'package:casino_test/src/presentation/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@immutable
class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _mainPageBloc = di<MainPageBloc>();
  int _pageKey = 2;

  final PagingController<int, Character> _pagingController =
      PagingController(firstPageKey: 2);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _mainPageBloc.add(GetTestDataOnMainPageEvent(_pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            _mainPageBloc..add(const GetTestDataOnMainPageEvent(1)),
        child: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {
            if (state is SuccessfulMainPageState) {
              if(state.characters.info?.next != null) {
                _pageKey += 1;
                _pagingController.appendPage(state.characters.characters ?? [], _pageKey);
              } else {
                _pagingController.appendLastPage(state.characters.characters ?? []);
              }
            }
          },
          builder: (blocContext, state) {
            if (state is LoadingMainPageState) {
              return _loadingWidget(context);
            } else if (state is SuccessfulMainPageState) {
              return _successfulWidget(context);
            } else {
              return const Center(child: Text("error"));
            }
          },
        ),
      ),
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget _successfulWidget(BuildContext context) {
    return PagedListView<int, Character>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Character>(
        itemBuilder: (context, item, index) => _characterWidget(context, item),
      ),
    );
  }

  Widget _characterWidget(BuildContext context, Character character) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(character.name ?? "Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Image.network(
                  character.image ?? "",
                  width: 50,
                  height: 50,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              _characterAttributeRow("Status", character.status),
              _characterAttributeRow("Species", character.species),
              _characterAttributeRow("Type", character.type),
              _characterAttributeRow("Gender", character.gender),
              _characterAttributeRow("Origin", character.origin?.name),
              _characterAttributeRow("Location", character.location?.name),
            ],
          ),
        ),
      ),
    );
  }

  Widget _characterAttributeRow(String attribute, String? value) {
    return value != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("$attribute: ",), Expanded(child: Text(value)),],
            ),
          )
        : const SizedBox.shrink();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
