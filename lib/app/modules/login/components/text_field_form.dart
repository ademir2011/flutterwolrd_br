import 'package:flutter/material.dart';

class Text_Field_Form {
  static Widget textFieldForm(
          {String labelText, onChanged, String Function() validateString}) =>
      TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: validateString(),
        ),
      );
}
