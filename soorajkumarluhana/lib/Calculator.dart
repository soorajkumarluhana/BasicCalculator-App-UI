import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result = result + text;
        });
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(primary: Colors.black45),
    );
  }



  Widget output(var equal) {
    return ElevatedButton(
        onPressed: () {
         Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    }); 
        },
        child: Text(equal));
  }

  Widget clear(var clear) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result = "";
        });
      },
      child: Text(clear),
      style: ElevatedButton.styleFrom(primary: Colors.black45),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basic Calculator",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.black45,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 500,
          decoration: BoxDecoration(color: Colors.black12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 500,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 30,
                      
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        btn("1"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("2"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("3"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("4"),
                      ],
                    ),
                    Row(
                      children: [
                        btn("5"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("6"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("7"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("8"),
                      ],
                    ),
                    Row(
                      children: [
                        btn("9"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("0"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("+"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("-"),
                      ],
                    ),
                    Row(
                      children: [
                        btn("*"),
                        SizedBox(
                          width: 5,
                        ),
                        btn("/"),
                        SizedBox(
                          width: 5,
                        ),
                        clear("C"),
                        SizedBox(
                          width: 5,
                        ),
                        output("="),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
