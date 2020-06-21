import 'package:bloc/bloc.dart';
import 'package:delesapp/bloc/menu_bloc/menu_event.dart';
import 'package:delesapp/bloc/menu_bloc/menu_state.dart';
import 'package:delesapp/data/models/menu_model.dart';
import 'package:delesapp/data/repositories/menu_repository.dart';
import 'package:meta/meta.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository repository;

  MenuBloc({@required this.repository});

  @override
  MenuState get initialState => MenuInitialState();

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is GetAllMenuEvent) {
      yield MenuLoadingState();
      try {
        List<Menu> menus = await repository.getAll();
        yield MenuLoadedState(menus: menus);
      } catch (e) {
        yield MenuErrorState(message: e.toString());
      }
    }
  }
  
}