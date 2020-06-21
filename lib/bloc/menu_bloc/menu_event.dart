import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {}

class GetAllMenuEvent extends MenuEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}