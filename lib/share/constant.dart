import 'package:flutter/material.dart';
import 'package:shop_abdullah_mansour/cache/cache_helper.dart';
import 'package:shop_abdullah_mansour/register_and_login/login_screen.dart';

ThemeData? lightTheme = ThemeData(
  // canvasColor: const Color(0xFFDBE6FD),
  primaryColor: primaryColor,
  accentColor: accentColor,
  unselectedWidgetColor: unselectedWidgetColor,
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    unselectedItemColor: defaultColor,
  ),
);
MaterialColor defaultColor = Colors.grey;
Color primaryColor = const Color(0xFF053742);
Color accentColor = const Color(0xFFA2DBFA);
Color unselectedWidgetColor = const Color(0xFFE8F0F2);
/*
MaterialColor darkDefaultColor = Colors.blueGrey;
Color darkPrimaryColor = const Color(0xFF47597E);
Color darkAccentColor = const Color(0xFFB2AB8C);
Color darkUnselectedWidgetColor = const Color(0xFFDBE6FD);
 */
void signOut(BuildContext context) {
  CacheHelper.deleteData('token');
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
}

// ignore: prefer_function_declarations_over_variables
Size Function(BuildContext context) size =
    (BuildContext context) => MediaQuery.of(context).size;
