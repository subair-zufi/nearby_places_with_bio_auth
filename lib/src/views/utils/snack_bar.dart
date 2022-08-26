import 'package:flutter/material.dart';

showSnackBar(BuildContext context, Widget content) {
  final snackBar = SnackBar(content: content);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
