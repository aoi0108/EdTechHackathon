import 'package:flutter/material.dart';
import 'package:edtech_hackathon/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goal Setting',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // テーマカラーの設定
        hintColor: Colors.lightBlueAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto', // フォントの指定
      ),
      home: const MyHomePage(title: 'Goal Setting'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController whatController = TextEditingController();
  final TextEditingController howMuchController = TextEditingController();
  final TextEditingController byWhenController = TextEditingController();
  final TextEditingController howController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              const Text(
                'あなたの目標は？',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('何を', whatController),
              const SizedBox(height: 20),
              _buildTextField('どれくらい', howMuchController),
              const SizedBox(height: 20),
              _buildTextField('いつまでに', byWhenController),
              const SizedBox(height: 20),
              _buildTextField('どうする', howController),
              const SizedBox(height: 40),
              TextButton(
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: Colors.lightBlue,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(
                        what: whatController.text,
                        howMuch: howMuchController.text,
                        byWhen: byWhenController.text,
                        how: howController.text,
                      ),
                    ),
                  );
                },
                child: const Text('次へ', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0, // 枠線の幅
                color: Colors.lightBlue, // 枠線の色
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0, // フォーカス時の枠線の幅
                color: Colors.lightBlueAccent, // フォーカス時の枠線の色
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0, // 非フォーカス時の枠線の幅
                color: Colors.blueGrey, // 非フォーカス時の枠線の色
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ],
    );
  }
}
