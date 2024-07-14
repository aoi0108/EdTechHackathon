import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
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
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    int amount = 0;
    int duration = 0;

    RegExp regExp = RegExp(r'(\d+)');
    Match match = regExp.firstMatch(widget.howMuch)!;
    amount = int.parse(match.group(0)!);

    match = regExp.firstMatch(widget.byWhen)!;
    duration = int.parse(match.group(0)!);

    double tasksPerDay = amount / duration;

    String unit = widget.howMuch.replaceAll(RegExp(r'[0-9]+'), '').trim();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Daily Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                '今日のタスク',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    activeColor: Colors.blue,
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      '${widget.what} ${tasksPerDay.toStringAsFixed(0)} $unit ${widget.how}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
