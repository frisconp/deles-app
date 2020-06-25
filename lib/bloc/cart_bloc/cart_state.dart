import 'package:delesapp/data/models/cart_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CartState extends Equatable {}

class CartInitialState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartState {
  final List<CartItem> list;

  CartLoadedState({@required this.list});

  @override
  List<Object> get props => [];
}
