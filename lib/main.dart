import 'package:delesapp/bloc/article_bloc/article_bloc.dart';
import 'package:delesapp/bloc/login_bloc/login_bloc.dart';
import 'package:delesapp/bloc/register_bloc/register_bloc.dart';
import 'package:delesapp/data/repositories/article_repository.dart';
import 'package:delesapp/data/repositories/login_repository.dart';
import 'package:delesapp/data/repositories/register_repository.dart';
import 'package:delesapp/splash.dart';
import 'package:delesapp/ui/login_page.dart';
import 'package:delesapp/ui/main_page.dart';
import 'package:delesapp/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..textColor = Colors.black
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleBloc>(
          create: (context) => ArticleBloc(repository: ArticleRepositoryList()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(repository: LoginRepositoryList()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(repository: RegisterRepositoryList()),
        ),
      ],
      child: FlutterEasyLoading(
        child: MaterialApp(
          title: 'DelesApp',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Color.fromRGBO(240, 165, 0, 1),
            scaffoldBackgroundColor: Color.fromRGBO(250, 250, 250, 1),
            textTheme: TextTheme(
              headline1: GoogleFonts.sourceSansPro(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              headline2: GoogleFonts.sourceSansPro(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/home': (context) => MainPage(),
          },
          home: SplashScreen(),
        ),
      ),
    );
  }
}
