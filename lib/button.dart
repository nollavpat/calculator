import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.handleOnPress, required this.label})
      : super(key: key);

  final VoidCallback handleOnPress;
  final String label;

  bool isOperator(String s) {
    return ['%', '/', 'x', '-', '+', '='].contains(s);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: isOperator(label)
                  ? const Color.fromARGB(200, 138, 154, 91)
                  : Color.fromARGB(255, 178, 190, 181),
              shape: const StadiumBorder()),
          onPressed: handleOnPress,
          child: Text(
            label,
            style: TextStyle(
                fontSize: 24,
                color: isOperator(label)
                    ? Color.fromARGB(255, 229, 228, 226)
                    : Color.fromARGB(255, 54, 69, 79)),
          )),
    );
  }
}
