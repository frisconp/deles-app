import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class GetUserProfileEvent extends ProfileEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
