import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String answer = '';
  String equation = '';

  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
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

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 229, 228, 226),
        body: Column(children: [
          Flexible(
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
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey[50],
                              shape: const StadiumBorder()),
                          onPressed: () {
                            setState(() {
                              equation += buttons[index];
                            });
                          },
                          child: Text(
                            buttons[index],
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black),
                          )),
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
