import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: Colors.black,
          selectedItemColor: Color.fromRGBO(0,162,142,1),
          unselectedItemColor: Colors.white,
        ),
      ),
      home: const AvatartCust(),
    );
  }
}

class AvatartCust extends StatefulWidget {
  const AvatartCust({super.key});
  @override
  _AvatartCustState createState() => _AvatartCustState();
}

class _AvatartCustState extends State<AvatartCust> {
  bool isHovered = false; // Define the isHovered variable
  String selectedImage = 'assets/ayyub.png'; // Default selected image


  // Function to handle option selection
  void selectOption(int index) {
    setState(() {
      // Update selectedImage based on the index
      switch (index) {
        case 1:
          selectedImage = 'assets/sen.png';
          break;
        case 2:
          selectedImage = 'assets/aqeel.png'; // Replace 'assets/image2.png' with your actual image path
          break;
        case 3:
          selectedImage = 'assets/dineth.png'; // Replace 'assets/image3.png' with your actual image path
          break;
        case 4:
          selectedImage = 'assets/man.png';
          break;
        default:
          selectedImage = 'assets/ayyub.png'; // Default case
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 300, sigmaY: 300), // Adjust the sigmaX and sigmaY values for blur intensity
                child: Image.asset(
                  'assets/spot.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Title "Choose your Avatar" with rounded white box stroke
          Positioned(
            top: 40, // Adjusted for better positioning
            left: 50, // Adjust as needed for horizontal centering
            right: 50, // Adjust as needed for horizontal centering
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black38.withOpacity(0.5), // Semi-transparent white background
                border: Border.all(color: Colors.white, width: 2.0), // White border
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              child: Text(
                'Choose your Avatar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15, // Adjusted for space
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Font color changed to black
                ),
              ),
            ),
          ),


          // User info container
          // User info container
          Positioned(
            right: 18,
            top: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
              child: Container(
                width: 100,
                height: 400, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.black38.withOpacity(0.7), // Example background color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(-10, 0), // Shadow position to the left
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: GridView.count(
                  crossAxisCount: 1, // Adjust as needed
                  padding: EdgeInsets.all(4),
                  children: List.generate(5, (index) {
                    // Example grid items
                    return GestureDetector(
                      onTap: () {
                        // Function to execute when the grid button is clicked
                        selectOption(index + 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12), // Apply borderRadius to each grid item
                        ),
                        margin: EdgeInsets.only(left: 4, top: 8, right: 4, bottom: 8), // Adjusted margin
                        child: Center(
                          child: Image.asset(
                            'assets/avatar${index + 1}.png', // Assuming your images are named as 'avatar1.png', 'avatar2.png', etc.
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
    ),
    ),

//select button
          Positioned(
            left: 40,
            top: 460,
            bottom: 140,
            right: 155,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Add logic for button press animation here
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000), // Adjust animation duration as needed
                curve: Curves.easeInOut,
                width: 90,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 162, 142, 1),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black38, width: 2.0),
                ),
                child: Center(
                  child: Text(
                    'Select',
                    style: TextStyle(
                      color: Colors.white, // Added comma here
                      fontSize: 15, // Changed semicolon to comma here
                    ),
                  ),
                ),
              ),
            ),
          ),



          Positioned(
            left: 8, // Adjust the left position as needed
            top: 100, // Adjust the top position as needed
            bottom: 180,
            right:110,
            child: Container(
              width: 140,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(selectedImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 55.0),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 4.0), // Black border
          ),
          child: const ClipOval(
            child: Material(
              color: Colors.white,
              child: Icon(
                Icons.camera_alt_outlined,
                size: 36,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
