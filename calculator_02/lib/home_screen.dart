import 'package:calculator_02/components/constans_file.dart';
import 'package:calculator_02/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Align(
                      alignment:Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Text(
                      answer.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                          title: "AC",
                          onpress: () {
                            userInput = "";
                            answer = "";
                            setState(() {});
                          }),
                      MyButton(
                          title: "+/-",
                          onpress: () {
                            userInput += "+/-";
                            setState(() {});
                          }),
                      MyButton(
                          title: "%",
                          onpress: () {
                            userInput += "%";
                            setState(() {});
                          }),
                      MyButton(
                          title: "/",
                          color: orangeColor,
                          onpress: () {
                            userInput += "/";
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: "7",
                          onpress: () {
                            userInput += "7";
                            setState(() {});
                          }),
                      MyButton(
                          title: "8",
                          onpress: () {
                            userInput += "8";
                            setState(() {});
                          }),
                      MyButton(
                          title: "9",
                          onpress: () {
                            userInput += "9";
                            setState(() {});
                          }),
                      MyButton(
                          title: "x",
                          color: orangeColor,
                          onpress: () {
                            userInput += "*";
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: "4",
                          onpress: () {
                            userInput += "4";
                            setState(() {});
                          }),
                      MyButton(
                          title: "5",
                          onpress: () {
                            userInput += "5";
                            setState(() {});
                          }),
                      MyButton(
                          title: "6",
                          onpress: () {
                            userInput += "6";
                            setState(() {});
                          }),
                      MyButton(
                          title: "-",
                          color: orangeColor,
                          onpress: () {
                            userInput += "-";
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: "1",
                          onpress: () {
                            userInput += "1";
                            setState(() {});
                          }),
                      MyButton(
                          title: "2",
                          onpress: () {
                            userInput += "2";
                            setState(() {});
                          }),
                      MyButton(
                          title: "3",
                          onpress: () {
                            userInput += "3";
                            setState(() {});
                          }),
                      MyButton(
                          title: "+",
                          color: orangeColor,
                          onpress: () {
                            userInput += "+";
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: "0",
                          onpress: () {
                            userInput += "0";
                            setState(() {});
                          }),
                      MyButton(
                          title: ".",
                          onpress: () {
                            userInput += ".";
                            setState(() {});
                          }),
                      MyButton(
                          title: "DEL",
                          onpress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }),
                      MyButton(
                          title: "=",
                          color: orangeColor,
                          onpress: () {
                            equalpress();
                            setState(() {});
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalpress() {
    //String finalUserInput;
    //finalUserInput= userInput.replaceAll("x","*");
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
