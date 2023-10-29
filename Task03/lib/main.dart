import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': ['Berlin', 'Madrid', 'Paris', 'Rome'],
      'correctAnswer': 'Paris'
    },
    {
      'questionText': 'Which language is most widely spoken worldwide?',
      'answers': ['English', 'Mandarin', 'Spanish', 'Arabic'],
      'correctAnswer': 'English'
    },
    // Add more questions similarly
  ];

  void answerQuestion(String answer) {
    if (questions[questionIndex]['correctAnswer'] == answer) {
      score++;
    }

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: questionIndex < questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  questions[questionIndex]['questionText'],
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ...(questions[questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => answerQuestion(answer),
                      child: Text(answer),
                    ),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Quiz Finished!',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Your Score: $score / ${questions.length}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }
}
