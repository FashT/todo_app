import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowButton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;

  ShowButton(this.text, this.onpressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: onpressed,
      child: Text(text),
    );
  }
}
