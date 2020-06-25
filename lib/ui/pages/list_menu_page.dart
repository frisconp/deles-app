import 'package:delesapp/bloc/menu_bloc/menu_bloc.dart';
import 'package:delesapp/bloc/menu_bloc/menu_event.dart';
import 'package:delesapp/bloc/menu_bloc/menu_state.dart';
import 'package:delesapp/data/models/menu_model.dart';
import 'package:delesapp/ui/base_page.dart';
import 'package:delesapp/ui/components/food_menu_card.dart';
import 'package:delesapp/ui/pages/cart_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMenuPage extends StatefulWidget {
  @override
  _ListMenuPageState createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  MenuBloc _menuBloc;

  double paymentTotal = 0;

  @override
  void initState() {
    super.initState();
    _menuBloc = BlocProvider.of<MenuBloc>(context);
    _menuBloc.add(GetAllMenuEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _headerMenu(),
                  Expanded(
                    child: BlocBuilder<MenuBloc, MenuState>(
                      builder: (context, state) {
                        var _returnCondition;

                        if (state is MenuInitialState) {
                          _returnCondition = BasePage().buildLoading();
                        }
                        if (state is MenuLoadingState) {
                          _returnCondition = BasePage().buildLoading();
                        }
                        if (state is MenuLoadedState) {
                          _returnCondition = _listMenu(state.menus);
                        }
                        if (state is MenuErrorState) {
                          _returnCondition =
                              BasePage().buildErrorUi(state.message);
                        }

                        return _returnCondition;
                      },
                    ),
                  ),
                ],
              ),
              _fixedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerMenu() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        'Menu',
        style: GoogleFonts.nunitoSans(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _listMenu(List<Menu> menus) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 130),
      itemCount: menus.length,
      itemBuilder: (context, index) => FoodMenuCard(
        menu: menus.elementAt(index),
      ),
    );
  }

  Widget _fixedButton() {
    return Positioned(
      bottom: 0,
      child: Container(
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
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  splashColor: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartListPage()));
                  },
                  child: Center(
                    child: Text(
                      'Your Cart',
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(219, 219, 219, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
