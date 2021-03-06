import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key, required this.equation})
      : super(key: key);

  final String equation;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 211, 211, 211),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Text(
                    equation,
                    style: const TextStyle(fontSize: 52),
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
        width: double.infinity,
      ),
    );
  }
}
