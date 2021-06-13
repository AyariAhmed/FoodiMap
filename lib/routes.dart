import 'package:flutter/widgets.dart';
import 'package:foodimap_flutter/screens/complete_profile/complete_profile_screen.dart';
import 'package:foodimap_flutter/screens/home/home_screen.dart';
import 'package:foodimap_flutter/screens/login_success/login_success_screen.dart';
import 'package:foodimap_flutter/screens/sign_in/sign_in_screen.dart';
import 'package:foodimap_flutter/screens/sign_up/sign_up_screen.dart';
import 'package:foodimap_flutter/screens/splash/splash_screen.dart';

final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => SplashScreen(),
  SignInScreen.routeName : (context) => SignInScreen(),
  LoginSuccessScreen.routeName : (context) => LoginSuccessScreen(),
  SignUpScreen.routeName : (context) => SignUpScreen(),
  CompleteProfileScreen.routeName : (context) => CompleteProfileScreen(),
  HomeScreen.routeName : (context) => HomeScreen()

};