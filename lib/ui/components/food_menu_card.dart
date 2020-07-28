import 'package:cached_network_image/cached_network_image.dart';
import 'package:delesapp/bloc/cart_bloc/cart_bloc.dart';
import 'package:delesapp/bloc/cart_bloc/cart_event.dart';
import 'package:delesapp/bloc/cart_bloc/cart_state.dart';
import 'package:delesapp/data/models/cart_item_model.dart';
import 'package:delesapp/data/models/menu_model.dart';
import 'package:delesapp/res/rupiah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta.dart';

class FoodMenuCard extends StatefulWidget {
  final Menu menu;

  const FoodMenuCard({Key key, @required this.menu}) : super(key: key);
  @override
  _FoodMenuCardState createState() => _FoodMenuCardState(menu: this.menu);
}

class _FoodMenuCardState extends State<FoodMenuCard> {
  CartBloc _cartBloc;

  final Menu menu;

  _FoodMenuCardState({@required this.menu});

  @override
  Widget build(BuildContext context) {
    _cartBloc = BlocProvider.of<CartBloc>(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10,
              color: Colors.black.withOpacity(.05),
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: menu.photo,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          menu.name,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          rupiah(double.parse(menu.price)),
                          style: GoogleFonts.nunitoSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tersisa ' + menu.stockAmount + ' Porsi',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _cartBloc.add(
                                  RemoveItemFromCartEvent(menu: this.menu));

                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1),
                              ),
                              child: Center(
                                child: BlocBuilder<CartBloc, CartState>(
                                  builder: (context, state) => Text(
                                    (state is CartLoadedState)
                                        ? _inCartAmount(state.list)
                                        : '0',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _cartBloc
                                  .add(AddItemToCartEvent(menu: this.menu));
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _inCartAmount(List<CartItem> list) {
    var itemData = list.singleWhere(
        (element) => element.menu.id == this.menu.id,
        orElse: () => null);

    if (itemData != null) {
      return itemData.amount.toString();
    } else {
      return 0.toString();
    }
  }
}
