import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitialState extends RegisterState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CreatingAccountState extends RegisterState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AccountCreatedState extends RegisterState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CreateAccountFailedState extends RegisterState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class RegisterErrorState extends RegisterState {
  final String message;

  RegisterErrorState({@required this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}
