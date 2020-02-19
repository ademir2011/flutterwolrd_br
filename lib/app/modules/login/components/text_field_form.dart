import 'package:flutter/material.dart';
// import 'package:flutterwolrd_br/app/utils/generate_profile.dart';

class TFF {
  static Widget textFieldForm(
          {@required String labelText,
          @required onChanged,
          @required String Function() validateString,
          bool obscureText = false}) =>
      TextFormField(
        // initialValue: labelText == 'login'
        //     ? GenerateProfile.login()
        //     : GenerateProfile.password(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: validateString(),
        ),
        obscureText: obscureText,
        maxLength: 100,
      );
}
