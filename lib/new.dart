import 'package:flutter/material.dart';


class MyTextFieldApp extends StatefulWidget {
  @override
  State<MyTextFieldApp> createState() => _MyTextFieldAppState();
}

class _MyTextFieldAppState extends State<MyTextFieldApp> {
  ValueNotifier<int> _textHasErrorNotifier = ValueNotifier(0);

  Widget _getPrefixText() {
    return Icon(Icons.ac_unit);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Center(
                      child: ValueListenableBuilder(
                        valueListenable: _textHasErrorNotifier,
                        builder: (BuildContext context, int value, Widget? child) {
                          return Text(value.toString());
                        },
                        child: _getPrefixText(),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        highlightColor: Colors.white70,
                        splashColor: Colors.white70,
                        onTap: () {
                          _textHasErrorNotifier.value++;
                        },
                        child: Container(
                          width: 300,
                          decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child:   Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Planets",
                                  style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontFamily: 'Schyler',
                                      fontSize: 20),
                                ),
                              ),
                              const Icon(Icons.arrow_right_alt_sharp)
                            ]),
                          ),
                        ),
                      ),
                    ),

                  ],
                )
            )
        )
    );
  }
}