import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color of the entire screen
      backgroundColor: Colors.blueGrey[50], // You can adjust this to any color

      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue, // You can also change the AppBar color here
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image widget
            Image.asset('assets/Tesla-Jobs-1024x585.jpg.webp', height: 300),
            
            // Welcome text with styling
            Text(
              'Welcome to Job Navigator',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Color of the text
              ),
            ),
            
            SizedBox(height: 20),
            
            // First button with custom color
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              child: Text('Go to Profile Page'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color of the button
                foregroundColor: Colors.white, // Text color on the button
              ),
            ),
            
            SizedBox(height: 10), // Space between the buttons
            
            // Second button with custom color
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/jobs'),
              child: Text('Explore Jobs'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Background color of the button
                foregroundColor: Colors.white, // Text color on the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
