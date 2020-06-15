import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {}

class CreateAccountEvent extends RegisterEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  CreateAccountEvent({
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
    @required this.password,
    @required this.confirmPassword,
  });

  @override
  List<Object> get props => throw UnimplementedError();
}
