import 'package:delesapp/bloc/order_bloc/order_bloc.dart';
import 'package:delesapp/bloc/order_bloc/order_event.dart';
import 'package:delesapp/bloc/order_bloc/order_state.dart';
import 'package:delesapp/data/models/order_model.dart';
import 'package:delesapp/ui/base_page.dart';
import 'package:delesapp/ui/components/order_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  OrderBloc orderBloc;

  @override
  void initState() {
    super.initState();
    orderBloc = BlocProvider.of<OrderBloc>(context);
    orderBloc.add(GetOrderHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'History',
      body: Expanded(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            var _returnCondition;
            if (state is OrderInitialState) {
              _returnCondition = BasePage().buildLoading();
            }
            if (state is OrderLoadingState) {
              _returnCondition = BasePage().buildLoading();
            }
            if (state is OrderHistorySuccessState) {
              _returnCondition = _buildOrderHistories(state.orderHistories);
            }
            if (state is OrderHistoryEmptyState) {
              _returnCondition = _buildEmptyHistory();
            }
            return _returnCondition;
          },
        ),
      ),
    );
  }

  Widget _buildOrderHistories(List<Order> orders) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10),
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderHistoryCard(
        order: orders.elementAt(index),
      ),
    );
  }

  Widget _buildEmptyHistory() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      child: Center(
        child: Text(
          'No order histories found.',
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
