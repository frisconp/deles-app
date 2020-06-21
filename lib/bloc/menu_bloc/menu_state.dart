import 'package:delesapp/data/models/menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class MenuState extends Equatable {}

class MenuInitialState extends MenuState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MenuLoadingState extends MenuState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MenuLoadedState extends MenuState {
  final List<Menu> menus;

  MenuLoadedState({@required this.menus});

  @override
  List<Object> get props => throw UnimplementedError();
}

class MenuErrorState extends MenuState {
  final String message;

  MenuErrorState({@required this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}