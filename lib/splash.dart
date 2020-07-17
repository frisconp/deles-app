import 'dart:async';

import 'package:delesapp/res/api_url_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkApiProvider() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var response = await http
          .get(ApiUrlList.checkApiServer)
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        String token = sharedPreferences.getString('token');
        if (token != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      }
    } on TimeoutException catch (_) {
      EasyLoading.showError('Service unavailable, try again later.',
          duration: Duration(minutes: 1));
    }
  }

  @override
  void initState() {
    super.initState();
    checkApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              SpinKitThreeBounce(
                color: Color.fromRGBO(229, 229, 229, 1),
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
