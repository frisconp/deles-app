import 'package:delesapp/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class ProfileSucceedState extends ProfileState {
  final User user;

  ProfileSucceedState({@required this.user});

  @override
  List<Object> get props => throw UnimplementedError();
}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState({@required this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}
