import 'package:delesapp/data/models/cart_item_model.dart';
import 'package:delesapp/res/rupiah.dart';
import 'package:delesapp/ui/components/food_menu_card.dart';
import 'package:delesapp/ui/pages/checkout_page.dart';
import 'package:delesapp/ui/pages/list_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delesapp/res/global_variables.dart' as globals;

class CartListPage extends StatefulWidget {
  @override
  _CartListPageState createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  double totalPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: GoogleFonts.nunitoSans(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListMenuPage()));
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      bottomNavigationBar: _fixedButton(),
      body: SafeArea(
        child: _cartItems(globals.cartItemList),
      ),
    );
  }

  Widget _cartItems(List<CartItem> items) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: items.length,
      itemBuilder: (context, index) => FoodMenuCard(
        menu: items.elementAt(index).menu,
      ),
    );
  }

  Widget _fixedButton() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          offset: Offset(0, -1),
          blurRadius: 10,
        ),
      ]),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total',
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                ),
              ),
              Text(
                rupiah(150000),
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CheckoutPage()));
                },
                borderRadius: BorderRadius.circular(15),
                child: Center(
                  child: Text(
                    'Pay Now',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
