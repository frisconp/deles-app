import 'dart:async';

import 'package:delesapp/bloc/login_bloc/login_bloc.dart';
import 'package:delesapp/bloc/login_bloc/login_event.dart';
import 'package:delesapp/bloc/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInitialState) {
          _buildInitialLogin();
        } else if (state is LoginValidatingState) {
          _buildLoadingLogin();
        } else if (state is LoginSucceedState) {
          _buildSuccessLogin();
          _navigateToHome();
        } else if (state is LoginFailedState) {
          _buildFailedLogin();
        } else if (state is LoginErrorState) {
          _buildErrorLogin(state.message);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeader(),
                _emailTextField(),
                _passwordTextField(),
                _loginButton(),
                _registrationSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Login',
          style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'Please login to continue.',
          style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailTextField() {
    return Container(
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
        controller: emailController,
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
          hintText: 'E-mail',
          hintStyle: GoogleFonts.sourceSansPro(
            color: Color.fromRGBO(219, 219, 219, 1),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
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
        controller: passwordController,
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
          hintText: 'Password',
          hintStyle: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
              color: Color.fromRGBO(219, 219, 219, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
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
          onTap: () {
            loginBloc.add(ValidateLoginEvent(
                email: emailController.text,
                password: passwordController.text));
          },
          child: Center(
            child: Text(
              'Login',
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
    );
  }

  Widget _registrationSection() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'Don\'t have an account?',
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
                Navigator.of(context).pushNamed('/register');
              },
              child: Center(
                child: Text(
                  'Create Account',
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
    );
  }

  _buildInitialLogin() {
    EasyLoading.show(status: 'Please wait');
  }

  _buildLoadingLogin() {
    EasyLoading.show(status: 'Checking');
  }

  _buildSuccessLogin() {
    EasyLoading.showSuccess('Success!');
  }

  _buildFailedLogin() {
    EasyLoading.showError('E-mail & Password does\'nt match.');
  }

  _buildErrorLogin(String message) {
    EasyLoading.showError(message);
  }

  _navigateToHome() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    });
  }
}
