import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  final String questionText;
  final Widget content;
  final int currentQuestion;
  final int totalQuestions;
  final String points;
  final VoidCallback onNextScreen;

  QuestionScreen({
    required this.questionText,
    required this.content,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.points,
    required this.onNextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Question $currentQuestion'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Menu functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Question Header
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    '$currentQuestion of $totalQuestions Preguntas',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Preguntas',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Points and Question Number Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Text('$currentQuestion'),
                  radius: 20,
                ),
                Text('Point: $points', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            // Question Content passed from the child class
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    questionText,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  content, // Custom content from the child
                ],
              ),
            ),
            SizedBox(height: 20),
            // Next Button (Arrow)
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: onNextScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
