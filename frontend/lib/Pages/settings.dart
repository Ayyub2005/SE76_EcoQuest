import 'package:flutter/material.dart';

void main() {
  runApp(InstructionsPage());
}

class InstructionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate the height of the bottom navigation bar
    final double bottomNavigationBarHeight = MediaQuery.of(context).padding.bottom;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.grey[200], // Background color
          child: Center(
            child: SingleChildScrollView( // Wrap with SingleChildScrollView
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Align children to the start
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30), // Add some space on top
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                    decoration: BoxDecoration(
                      color: Colors.black38.withOpacity(0.5), // Semi-transparent black background
                      border: Border.all(color: Colors.white, width: 2.0), // White border
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    child: Text(
                      'Game Instructions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Step 01 (1).png', // Replace with your image asset path
                    height: 340, // Adjust height as needed
                    width: 340, // Adjust width as needed
                  ),
                  Image.asset(
                    'assets/Step 2.png', // Replace with your image asset path
                    height: 340, // Adjust height as needed
                    width: 340, // Adjust width as needed
                  ),
                  Image.asset(
                    'assets/Step 3.png', // Replace with your image asset path
                    height: 340, // Adjust height as needed
                    width: 340, // Adjust width as needed
                  ),
                  SizedBox(height: 100), // Add space for the bottom navigation bar
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
