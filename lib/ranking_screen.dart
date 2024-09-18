import 'package:flutter/material.dart';
import 'main.dart'; // Import the main screen

class RankingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Your Performance'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Add menu functionality if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Number of Points
            Text(
              'Number of Points : 500',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Leaderboard List
            buildLeaderboardItem(context, 1, 'Level1', '1000', Colors.amber, Icons.emoji_events),
            SizedBox(height: 20),
            buildLeaderboardItem(context, 2, 'Level2', '600', Colors.grey, Icons.emoji_events),
            SizedBox(height: 20),
            buildLeaderboardItem(context, 3, 'Level3', '300', Colors.brown, Icons.emoji_events),
            Spacer(),

            // Next Button
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  // Navigate to MainScreen when next button is clicked
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                        (Route<dynamic> route) => false, // Removes all routes
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build each leaderboard item
  Widget buildLeaderboardItem(BuildContext context, int rank, String level, String points, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
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
      child: Row(
        children: [
          // Rank Circle
          CircleAvatar(
            backgroundColor: Colors.grey[400],
            radius: 20,
            child: Text(
              '$rank',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          SizedBox(width: 20),

          // Level and Points Information
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                level,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                points,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
          Spacer(),

          // Trophy Icon
          Icon(icon, color: color, size: 40),
        ],
      ),
    );
  }
}
