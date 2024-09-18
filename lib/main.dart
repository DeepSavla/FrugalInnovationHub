import 'package:flutter/material.dart';
import 'learn_screen.dart';
import 'question_screen1.dart'; // Import the Play for Points screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Emiliano Martinez'),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'), // Use an appropriate profile image here
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Progress Section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tu progreso',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Puntos: 1652'),
                  Text('Nivel: 3'),
                  Text('Logros: 15'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Learn Basic Concepts Button
            buildMenuButton(
              context,
              'Learn Basic Concepts',
              Colors.green,
              Icons.lightbulb_outline,
              LearnScreen(),
            ),
            SizedBox(height: 20),
            // Practice Button
            buildMenuButton(
              context,
              'Practice',
              Colors.pinkAccent,
              Icons.extension,
              LearnScreen(), // Placeholder; change to the practice screen if needed
            ),
            SizedBox(height: 20),
            // Play for Points Button
            buildMenuButton(
              context,
              'Play for Points',
              Colors.orangeAccent,
              Icons.play_arrow,
              QuestionScreen1(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build menu buttons
  Widget buildMenuButton(BuildContext context, String text, Color color, IconData icon, Widget nextScreen) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextScreen),
          );
        },
      ),
    );
  }
}
