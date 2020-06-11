import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Daftar',
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Isi formulir berikut untuk membuat akun.',
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(219, 219, 219, 1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: TextField(
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: Color.fromRGBO(240, 165, 0, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Nama Lengkap',
                    hintStyle: GoogleFonts.sourceSansPro(
                      color: Color.fromRGBO(219, 219, 219, 1),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(219, 219, 219, 1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: TextField(
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Icon(
                        Icons.mail_outline,
                        color: Color.fromRGBO(240, 165, 0, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Alamat Email',
                    hintStyle: GoogleFonts.sourceSansPro(
                      color: Color.fromRGBO(219, 219, 219, 1),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(219, 219, 219, 1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: TextField(
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Icon(
                        Icons.phone,
                        color: Color.fromRGBO(240, 165, 0, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Nomor Telepon',
                    hintStyle: GoogleFonts.sourceSansPro(
                      color: Color.fromRGBO(219, 219, 219, 1),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(219, 219, 219, 1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: TextField(
                  obscureText: true,
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(240, 165, 0, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Kata Sandi',
                    hintStyle: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(219, 219, 219, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(219, 219, 219, 1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: TextField(
                  obscureText: true,
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(240, 165, 0, 1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Konfirmasi Kata Sandi',
                    hintStyle: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(219, 219, 219, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 165, 0, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'Buat akun',
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Sudah memiliki akun?',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    color: Color.fromRGBO(219, 219, 219, 1),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(219, 219, 219, 1),
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Center(
                      child: Text(
                        'Masuk',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(240, 165, 0, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
