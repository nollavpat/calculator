import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key, required this.answer, required this.equation})
      : super(key: key);

  final String answer;
  final String equation;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
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
                    style: const TextStyle(fontSize: 36),
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Container(
                  child: Text(
                    answer,
                    style: const TextStyle(fontSize: 36),
                    textAlign: TextAlign.left,
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
            )
          ],
        ),
        width: double.infinity,
      ),
    );
  }
}
