import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: Colors.black,
          selectedItemColor: const Color.fromRGBO(0, 162, 142, 1).withOpacity(0.7),
          unselectedItemColor: Colors.white,
        ),
       ),
      home: Character_cust(),
    );
  }
}

// class Character_cust extends StatelessWidget {
class Character_cust extends StatefulWidget {
  @override
  _Character_custState createState() => _Character_custState();
}

class _Character_custState extends State<Character_cust> {
  String displayedAccessory = 'assets/dog-character_default.png';
  Set<int> selectedAccessories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
              child: Opacity(
                opacity: 0.5, // Adjust opacity between 0.0 (fully transparent) and 1.0 (fully opaque)
                child: Image.asset(
                 'assets/background6.png',
                  fit: BoxFit.cover,
                )
            ),
          ),
          // Title "Choose your Avatar" with rounded white box stroke
          Positioned(
            top: 30, // Adjusted for better positioning
            left: 50, // Adjust as needed for horizontal centering
            right: 50, // Adjust as needed for horizontal centering
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black38.withOpacity(0.5), // Semi-transparent white background
                border: Border.all(color: Colors.white, width: 2.0), // White border
                borderRadius: BorderRadius.circular(18), // Rounded corners
              ),
              child: Text(
                'Customize your character',
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
          // Positioned(
          //   right: 5,
          //   top: 170,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(12),
          //     child: Container(
          //       width: 120,
          //       height: 450,
          //       color: Colors.black38.withOpacity(0.4),
          //       child: GridView.count(
          //         crossAxisCount: 1,
          //         padding: EdgeInsets.all(12),
          //         children: List.generate(5, (index) {
          //           return GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 if (index == 0 || index == 1) {
          //                   selectedAccessories.add(index);
          //                 } else {
          //                   selectedAccessories.remove(index);
          //                   ScaffoldMessenger.of(context).showSnackBar(
          //                     SnackBar(
          //                       content: Text('Accessory Locked,Scan to unlock new acccessories'),
          //                       duration: Duration(milliseconds: 1000),
          //                     ),
          //                   );
          //                 }
          //
          //                 // Check if both accessories are selected
          //                 if (selectedAccessories.contains(0) && selectedAccessories.contains(1)) {
          //                   displayedAccessory = 'assets/dog_char_access_1.2.png';
          //                 } else if (selectedAccessories.contains(0)) {
          //                   displayedAccessory = 'assets/dog_char_access_2.png';
          //                 } else if (selectedAccessories.contains(1)) {
          //                   displayedAccessory = 'assets/dog-character_default.png';
          //                 } else {
          //                   displayedAccessory = 'assets/dog-character_default.png';
          //                 }
          //               });
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: Colors.white54.withOpacity(0.7),
          //                 borderRadius: BorderRadius.circular(12),
          //               ),
          //               margin: EdgeInsets.all(8),
          //               child: Center(
          //                 child: index == 0 || index == 1
          //                     ? Image.asset(
          //                   'assets/accessory_${index + 1}.png',
          //                   fit: BoxFit.cover,
          //                 )
          //                     : Icon(
          //                   Icons.lock,
          //                   color: Colors.black,
          //                   size: 36,
          //                 ),
          //               ),
          //             ),
          //           );
          //         }),
          //       ),
          //     ),
          //   ),
          // ),
          // if (displayedAccessory.isNotEmpty)
          //   Positioned(
          //     left: 0,
          //     top: 320,
          //     child: Image.asset(
          //       displayedAccessory,
          //       width: 270,
          //       height: 330,
          //       fit: BoxFit.cover,
          //     ),
          //   ),

          // Accessory container
          Positioned(
            right: 5,
            top: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 120,
                height: 450,
                color: Colors.black38.withOpacity(0.4),
                child: GridView.count(
                  crossAxisCount: 1,
                  padding: EdgeInsets.all(12),
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (index == 0) {
                            displayedAccessory = 'assets/dog_char_access_2.png';
                          } else if (index == 1) {
                            displayedAccessory = 'assets/dog_char_access_1.2.png';
                          } else {
                            displayedAccessory = 'assets/dog-character_default.png';
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Accessory Locked,Scan to unlock new acccessories'),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white54.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.all(8),
                        child: Center(
                          child: index==0||index==1
                              ?Image.asset(
                                'assets/accessory_${index + 1}.png',
                                fit: BoxFit.cover,
                              )
                              : Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                  size:36 ,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          // Display character images on left-hand side
          if (displayedAccessory.isNotEmpty) // Only display if an accessory is selected
            Positioned(
              left: 0,
              top: 320,
              child: AnimatedOpacity(
                opacity: displayedAccessory == 'assets/dog-character_default.png' ? 0.7 : 1.0 ,
                duration: Duration(milliseconds: 500),
                child: Image.asset(
                  displayedAccessory,
                  width: 270,
                  height: 330,
                  fit: BoxFit.cover,
                ),
              ),
            ),



          // // Bottom navigation bar with notch
          Positioned(
            left: 20, // Adjust the left position as needed
            top: 180,
            right: 180,
            bottom: 160,// Adjust the top position as needed
            child: Container(
              width: 230,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/animal-2.png'), // Replace 'assets/character_image.png' with your image path
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
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
                      'assets/dragon.png',
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
