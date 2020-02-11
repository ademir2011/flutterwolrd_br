import 'package:flutter/material.dart';

class Components {
  BoxDecoration backgroundDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF514A9D), Color(0xFF24C6DC)],
      ),
    );
  }
}
