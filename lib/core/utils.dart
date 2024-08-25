import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
