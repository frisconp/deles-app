import 'package:delesapp/data/models/menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CartEvent extends Equatable {}

class AddItemToCartEvent extends CartEvent {
  final Menu menu;

  AddItemToCartEvent({@required this.menu});

  @override
  List<Object> get props => throw UnimplementedError();
}

class RemoveItemFromCartEvent extends CartEvent {
  final Menu menu;

  RemoveItemFromCartEvent({@required this.menu});

  @override
  List<Object> get props => throw UnimplementedError();
}
