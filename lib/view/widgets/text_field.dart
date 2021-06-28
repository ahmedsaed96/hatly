import 'package:flutter/material.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';

TextFormField buildTextFormField({
  required TextInputType type,
  required IconData prefixIcon,
  bool obsecureText = false,
  Function? function,
  Function? onSavedFunction,
  Widget? suffexIcon,
  required String name,
  required TextEditingController controller,
}) {
  return TextFormField(
    onSaved: (newValue) => onSavedFunction,
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please Enter a valid $name';
      }
      return null;
    },
    keyboardType: type,
    obscureText: obsecureText,
    decoration: InputDecoration(
      labelText: 'Email Address',
      enabledBorder: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: defaultColor),
      ),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffexIcon,
    ),
  );
}
