import 'package:delesapp/ui/base_page.dart';
import 'package:delesapp/ui/components/order_history_card.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Pesanan',
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: 10,
            itemBuilder: (context, index) => OrderHistoryCard(),
          ),
        ),
      ),
    );
  }
}
