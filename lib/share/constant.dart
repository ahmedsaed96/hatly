

import 'package:flutter/material.dart';
import 'package:shop_abdullah_mansour/cache/cache_helper.dart';
import 'package:shop_abdullah_mansour/register_and_login/login_screen.dart';

MaterialColor defaultColor = Colors.lightBlue;
void signOut(BuildContext context) {
  CacheHelper.deleteData('token');
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
}

  // ignore: prefer_function_declarations_over_variables
  Size Function(BuildContext context) size = (BuildContext context) => MediaQuery.of(context).size;
