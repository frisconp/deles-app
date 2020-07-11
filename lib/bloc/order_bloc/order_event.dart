import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class OrderEvent extends Equatable {}

class CreateOrderEvent extends OrderEvent {
  final String note;

  CreateOrderEvent({@required this.note});

  @override
  List<Object> get props => throw UnimplementedError();
}

class GetOrderHistoryEvent extends OrderEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
