import 'package:delesapp/data/models/order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class OrderState extends Equatable {}

class OrderInitialState extends OrderState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class OrderLoadingState extends OrderState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class OrderCreatedState extends OrderState {
  final Map<String, dynamic> responseData;

  OrderCreatedState({@required this.responseData});

  @override
  List<Object> get props => throw UnimplementedError();
}

class OrderErrorState extends OrderState {
  final String message;

  OrderErrorState({@required this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}

class OrderHistorySuccessState extends OrderState {
  final List<Order> orderHistories;

  OrderHistorySuccessState({@required this.orderHistories});

  @override
  List<Object> get props => throw UnimplementedError();
}

class OrderHistoryEmptyState extends OrderState {
  @override
  List<Object> get props => throw UnimplementedError();
}
