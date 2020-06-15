import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {}

class ValidateLoginEvent extends LoginEvent {
  final String email;
  final String password;

  ValidateLoginEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => throw UnimplementedError();
}
