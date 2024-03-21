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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            top: 20, // Adjusted for better positioning
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
                        height: 5,
                        width: 5,
                        child: Center(
                          child: Text(
                            'Avatar ${index + 1}',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),


          Positioned(
            left: 40,
            top: 480,
            bottom: 130,
            right: 155,
            child: Material(
              color: Colors.transparent,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: Container(
                  width: 70,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    child: Text(
                      'Select',
                      style: TextStyle(color: isHovered ? Colors.white : Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.white.withOpacity(1);
                          }
                          return Color.fromRGBO(0, 162, 142, 1);
                        },
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Colors.black38,
                            width: 2.0,
                          ),
                        ),
                      ),
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
          // Bottom navigation bar with notch
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              color: Colors.black, // Adjusted for dark theme
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.home, color: Colors.white), // Adjusted icon color
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/dragon (1).png',
                      width: 30,
                      height: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.people, color: Colors.white), // Adjusted icon color
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.settings, color: Colors.white), // Adjusted icon color
                    onPressed: () {},
                  ),
                ],
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
