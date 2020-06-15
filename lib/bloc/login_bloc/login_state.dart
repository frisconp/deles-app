import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginValidatingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSucceedState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoginFailedState extends LoginState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({@required this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}
