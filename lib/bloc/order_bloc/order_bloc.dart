import 'package:bloc/bloc.dart';
import 'package:delesapp/bloc/order_bloc/order_event.dart';
import 'package:delesapp/bloc/order_bloc/order_state.dart';
import 'package:delesapp/data/repositories/order_repository.dart';
import 'package:meta/meta.dart';
import 'package:delesapp/res/global_variables.dart' as globals;

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository repository;

  OrderBloc({@required this.repository});

  @override
  OrderState get initialState => OrderInitialState();

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is CreateOrderEvent) {
      yield OrderLoadingState();
      try {
        int paymentTotal = 0;
        List<Map<String, dynamic>> orderItems = [];

        for (var item in globals.cartItemList) {
          paymentTotal += int.parse(item.menu.price) * item.amount;
          orderItems.add(item.toJson());
        }

        Map<String, dynamic> requestData = {
          'payment_total': paymentTotal,
          'note': event.note,
          'order_items': orderItems,
        };

        var orderData = await repository.createNewOrder(requestData);

        if (orderData['token'] != null) {
          yield OrderCreatedState(responseData: orderData);
        } else {
          yield OrderErrorState(message: 'Failed to Create Order.');
        }
      } catch (e) {
        print(e);
        yield OrderErrorState(message: e.toString());
      }
    }
  }
}
