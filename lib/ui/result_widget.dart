import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {

  final Function _onRestartRequested;

  const ResultWidget(this._onRestartRequested, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "The quiz is over! Well done!",
            style: TextStyle(
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                onPressed: () => _onRestartRequested(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    "Restart the quiz!",
                    style: TextStyle(fontSize: 24),
                  ),
                ))),
      ],
    );
  }
}
