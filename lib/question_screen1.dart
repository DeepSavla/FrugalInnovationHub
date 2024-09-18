import 'package:flutter/material.dart';
import 'question_screen.dart';
import 'question_screen2.dart'; // Import the second question screen

class QuestionScreen1 extends StatelessWidget {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return QuestionScreen(
      questionText: 'Telling the Time!\nAnalog to Digital:',
      content: Column(
        children: [
          // Set the background color to match the dark green toolbar
          Container(
            color: Colors.green, // Same as AppBar color
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                // Clock image
                Image.asset('assets/clock_image.png', height: 150),
                SizedBox(height: 20),
                // Input boxes row, now centered
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the input boxes
                  children: [
                    buildInputBox(_controller1),
                    SizedBox(width: 20), // Add spacing between the boxes
                    buildInputBox(_controller2),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      currentQuestion: 1,
      totalQuestions: 10,
      points: '00',
      onNextScreen: () {
        // Navigate to Question Screen 2 when the arrow button is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuestionScreen2()),
        );
      },
    );
  }

  // Helper function to build input box
  Widget buildInputBox(TextEditingController controller) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '--', // Show dashes as the hint
          ),
        ),
      ),
    );
  }
}
