import 'package:bloc/bloc.dart';
import 'package:delesapp/bloc/cart_bloc/cart_event.dart';
import 'package:delesapp/bloc/cart_bloc/cart_state.dart';
import 'package:delesapp/data/models/cart_item_model.dart';
import 'package:delesapp/res/global_variables.dart' as globals;

class CartBloc extends Bloc<CartEvent, CartState> {
  @override
  CartState get initialState => CartInitialState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddItemToCartEvent) {
      var itemData = globals.cartItemList.singleWhere(
          (item) => item.menu.id == event.menu.id,
          orElse: () => null);

      if (itemData != null) {
        itemData.amount++;
      } else {
        CartItem newItem = CartItem(menu: event.menu, amount: 1);
        globals.cartItemList.add(newItem);
      }

      print('Event AddItemToCartEvent Success!');

      yield CartLoadedState(list: globals.cartItemList);
    }

    if (event is RemoveItemFromCartEvent) {
      var itemData = globals.cartItemList.singleWhere(
          (item) => item.menu.id == event.menu.id,
          orElse: () => null);

      if (itemData != null) {
        itemData.amount--;
        if (itemData.amount == 0) {
          globals.cartItemList.remove(itemData);
        }
      }

      print('Event RemoveItemFromCartEvent Success!');

      yield CartLoadedState(list: globals.cartItemList);
    }
  }
}
