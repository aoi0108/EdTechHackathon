import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String what;
  final String howMuch;
  final String byWhen;
  final String how;

  const NextPage({
    Key? key,
    required this.what,
    required this.howMuch,
    required this.byWhen,
    required this.how,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int amount = 0;
    int duration = 0;

    RegExp regExp = RegExp(r'(\d+)');
    Match match = regExp.firstMatch(howMuch)!;
    amount = int.parse(match.group(0)!);

    match = regExp.firstMatch(byWhen)!;
    duration = int.parse(match.group(0)!);

    double tasksPerDay = amount / duration;

    String unit = howMuch.replaceAll(RegExp(r'[0-9]+'), '').trim();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Daily Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.all(20),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.lightBlue, width: 2),
              //   borderRadius: BorderRadius.circular(12),
              // ),
              child: Text(
                '$what $howMuch $byWhen $how',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                '今日のタスク \n${tasksPerDay.toStringAsFixed(0)} $unit $how',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
