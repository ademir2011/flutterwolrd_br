import 'package:flutter/material.dart';

class GB {
  static Widget googleButton(Function onPressed) => RaisedButton(
        onPressed: onPressed,
        color: Color(0xffffffff),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/g_logo.png',
              width: 18.0,
              height: 18.0,
            ),
            SizedBox(
              width: 24.0,
            ),
            Text(
              'Fazer Login com o Google',
              style: TextStyle(
                color: Color(0x8A000000),
                fontSize: 14.0,
              ),
            )
          ],
        ),
      );
}
