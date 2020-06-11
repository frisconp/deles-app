import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class CreateAccountEvent extends RegisterEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
