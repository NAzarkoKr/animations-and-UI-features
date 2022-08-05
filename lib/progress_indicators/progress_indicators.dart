import 'dart:math';

import 'package:flutter/material.dart';

class ProgressIndicators extends StatefulWidget {
  const ProgressIndicators({Key? key}) : super(key: key);

  @override
  State<ProgressIndicators> createState() => _ProgressIndicatorsState();
}

class _ProgressIndicatorsState extends State<ProgressIndicators> {
  double endValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Progress indicators')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: endValue),
              duration: const Duration(seconds: 2),
              builder: (context, double? value, _) => SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  value: value,
                  strokeWidth: 8,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: endValue),
                duration: const Duration(seconds: 2),
                builder: (context, double? value, _) => SizedBox(
                      width: 200,
                      height: 40,
                      child: LinearProgressIndicator(
                        value: value,
                        valueColor: const AlwaysStoppedAnimation(Colors.green),
                        backgroundColor: Colors.white,
                      ),
                    )),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  double randomdouble = Random().nextDouble();

                  randomdouble = double.parse(randomdouble.toStringAsFixed(2));
                  endValue = randomdouble;
                });
              },
              label: const Text("Download"),
              icon: const Icon(Icons.file_download),
            )
          ],
        ),
      ),
    );
  }
}
