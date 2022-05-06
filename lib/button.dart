import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.handleOnPress, required this.label})
      : super(key: key);

  final VoidCallback handleOnPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.grey[50], shape: const StadiumBorder()),
        onPressed: handleOnPress,
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ));
  }
}
