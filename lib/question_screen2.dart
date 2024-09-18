import 'package:flutter/material.dart';
import 'question_screen.dart';
import 'ranking_screen.dart'; // Import the ranking screen

class QuestionScreen2 extends StatefulWidget {
  @override
  _QuestionScreen2State createState() => _QuestionScreen2State();
}

class _QuestionScreen2State extends State<QuestionScreen2> {
  Color option1Color = Colors.white; // For "Hour"
  Color option2Color = Colors.white; // For "Minutes"
  Color option3Color = Colors.white; // For "Seconds"

  void checkAnswer(int selectedOption) {
    setState(() {
      // Reset all colors
      option1Color = Colors.white;
      option2Color = Colors.white;
      option3Color = Colors.white;

      // Set the color based on the selected option
      if (selectedOption == 2) {
        option2Color = Colors.green; // Correct answer (Minutes)
      } else {
        if (selectedOption == 1) {
          option1Color = Colors.red; // Incorrect (Hour)
        } else if (selectedOption == 3) {
          option3Color = Colors.red; // Incorrect (Seconds)
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return QuestionScreen(
      questionText: 'What does long hand on clock represent?',
      content: Column(
        children: [
          buildAnswerButton('Hour', 1, option1Color),
          SizedBox(height: 10),
          buildAnswerButton('Minutes', 2, option2Color),
          SizedBox(height: 10),
          buildAnswerButton('Seconds', 3, option3Color),
        ],
      ),
      currentQuestion: 2,
      totalQuestions: 10,
      points: '01',
      onNextScreen: () {
        // Navigate to Ranking Screen when next button is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RankingScreen()),
        );
      },
    );
  }

  // Helper function to build the answer button
  Widget buildAnswerButton(String text, int option, Color buttonColor) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          checkAnswer(option);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, // Correct way to set button color dynamically
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
