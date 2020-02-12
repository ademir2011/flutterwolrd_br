import 'package:flutter/material.dart';
// import 'package:flutterwolrd_br/app/utils/generate_profile.dart';

class Text_Field_Form {
  static Widget textFieldForm(
          {String labelText, onChanged, String Function() validateString}) =>
      TextFormField(
        // initialValue: labelText == 'login'
        //     ? GenerateProfile.login()
        //     : GenerateProfile.password(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: validateString(),
        ),
      );
}
