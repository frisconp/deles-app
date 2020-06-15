import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMenuPage extends StatefulWidget {
  @override
  _ListMenuPageState createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(219, 219, 219, 1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _listMenu(),
            _fixedButton(),
          ],
        ),
      ),
    );
  }

  Widget _listMenu() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            'Menu',
            style: GoogleFonts.sourceSansPro(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _fixedButton() {
    return Positioned(
      child: Container(
        width: double.infinity,
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
              child: Center(
                child: Text(
                  'Lihat Pesanan Anda',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Center(
                child: Text('Batalkan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
