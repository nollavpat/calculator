import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'button.dart';
import 'screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = '';
  String lastAnswer = '';

  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  void handleOnPress(String label) {
    setState(() {
      equation += label;
    });
  }

  final Parser p = Parser();
  final ContextModel cm = ContextModel();

  num doubleWithoutDecimalToInt(double val) {
    return val % 1 == 0 ? val.toInt() : val;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 229, 228, 226),
        body: Column(children: [
          Screen(equation: equation),
          Flexible(
            flex: 2,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Button(
                      handleOnPress: () {
                        setState(() {
                          equation = '';
                        });
                      },
                      label: buttons[index],
                    );
                  }

                  if (index == 1) {
                    return Button(
                      handleOnPress: () {
                        setState(() {
                          if (equation.isNotEmpty) {
                            equation =
                                equation.substring(0, equation.length - 1);
                          }
                        });
                      },
                      label: buttons[index],
                    );
                  }

                  if (index == buttons.length - 1) {
                    return Button(
                      handleOnPress: () {
                        setState(() {
                          String sanitizedEquation =
                              equation.replaceAll('x', '*');
                          Expression exp = p.parse(sanitizedEquation);
                          double eval = exp.evaluate(EvaluationType.REAL, cm);

                          String result =
                              doubleWithoutDecimalToInt(eval).toString();
                          lastAnswer = result;
                          equation = result;
                        });
                      },
                      label: buttons[index],
                    );
                  }

                  if (index == buttons.length - 2) {
                    return Button(
                      handleOnPress: () {
                        setState(() {
                          equation += lastAnswer;
                        });
                      },
                      label: buttons[index],
                    );
                  }

                  return Button(
                    handleOnPress: () => handleOnPress(buttons[index]),
                    label: buttons[index],
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
