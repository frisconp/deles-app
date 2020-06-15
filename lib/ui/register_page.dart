import 'dart:async';

import 'package:delesapp/bloc/register_bloc/register_bloc.dart';
import 'package:delesapp/bloc/register_bloc/register_event.dart';
import 'package:delesapp/bloc/register_bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc registerBloc;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterInitialState) {
          _buildInitialRegister();
        } else if (state is CreatingAccountState) {
          _buildLoadingRegister();
        } else if (state is AccountCreatedState) {
          _buildSuccessRegister();
          _navigateToLogin();
        } else if (state is CreateAccountFailedState) {
          _buildFailedRegister();
        } else if (state is RegisterErrorState) {
          _buildErrorRegister(state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _header(),
                  _fullNameField(),
                  _emailField(),
                  _phoneNumberField(),
                  _passwordField(),
                  _confirmPasswordField(),
                  _createAccountButton(),
                  _loginSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Create Account',
          style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'Please fill the following form to create an account.',
          style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _fullNameField() {
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
        controller: nameController,
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
          hintText: 'Full Name',
          hintStyle: GoogleFonts.sourceSansPro(
            color: Color.fromRGBO(219, 219, 219, 1),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
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
              Icons.mail_outline,
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

  Widget _phoneNumberField() {
    return Container(
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
        controller: phoneNumberController,
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
          hintText: 'Phone Number',
          hintStyle: GoogleFonts.sourceSansPro(
            color: Color.fromRGBO(219, 219, 219, 1),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
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

  Widget _confirmPasswordField() {
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
        controller: confirmPasswordController,
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
          hintText: 'Confirmation Password',
          hintStyle: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
              color: Color.fromRGBO(219, 219, 219, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createAccountButton() {
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
            registerBloc.add(CreateAccountEvent(
              name: nameController.text,
              email: emailController.text,
              phoneNumber: phoneNumberController.text,
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text,
            ));
          },
          child: Center(
            child: Text(
              'Create Account',
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

  Widget _loginSection() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'Already have an account?',
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
                  'Login',
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

  _buildInitialRegister() {
    EasyLoading.show(status: 'Please wait');
  }

  _buildLoadingRegister() {
    EasyLoading.show(status: 'Checking');
  }

  _buildSuccessRegister() {
    EasyLoading.showSuccess('Success!');
  }

  _buildFailedRegister() {
    EasyLoading.showError('Harap isi semua kolom.');
  }

  _buildErrorRegister(String message) {
    EasyLoading.showError(message);
  }

  _navigateToLogin() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed('/login');
    });
  }
}
