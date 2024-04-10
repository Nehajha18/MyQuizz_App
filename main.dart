import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;

  List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Berlin', 'Rome'],
      'correctAnswer': 'Paris',
    },
    {
      'questionText': 'What is the largest planet in our solar system?',
      'answers': ['Jupiter', 'Saturn', 'Neptune', 'Earth'],
      'correctAnswer': 'Jupiter',
    },
    {
      'questionText': 'Who painted the Mona Lisa?',
      'answers': ['Leonardo da Vinci', 'Vincent van Gogh', 'Pablo Picasso', 'Michelangelo'],
      'correctAnswer': 'Leonardo da Vinci',
    },
  ];

  void _checkAnswer(String selectedAnswer) {
    String correctAnswer = _questions[_questionIndex]['correctAnswer'] as String;
    setState(() {
      if (selectedAnswer == correctAnswer) {
        _score++;
      }
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _questionIndex < _questions.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _questions[_questionIndex]['questionText'] as String,
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Column(
                children: (_questions[_questionIndex]['answers'] as List<String>).map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ElevatedButton(
                      onPressed: () => _checkAnswer(answer),
                      child: Text(answer),
                    ),
                  );
                }).toList(),
              ),
            ],
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quiz Completed!',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Your Score: $_score / ${_questions.length}',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _resetQuiz,
                  child: Text('Restart Quiz'),
                ),
              ],
            ),
          );
  }
}
