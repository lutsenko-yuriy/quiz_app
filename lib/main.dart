import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void answerQuestion(String answer) {
    print(answer);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What is your name?",
      "What is your quest?",
      "What is your favorite color?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My first page"),
        ),
        body: Column(
          children: [
            Text("The question"),
            ElevatedButton(
              onPressed: () => answerQuestion("Answer 1 is selected"),
              child: Text("Answer 1"),
            ),
            ElevatedButton(
              onPressed: () => answerQuestion("Answer 2 is selected"),
              child: Text("Answer 2"),
            ),
            ElevatedButton(
              onPressed: () => answerQuestion("Answer 3 is selected"),
              child: Text("Answer 3"),
            ),
          ],
        ),
      ),
    );
  }
}
