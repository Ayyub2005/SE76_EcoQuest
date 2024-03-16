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
      home: const Character_cust(),
    );
  }
}

class Character_cust extends StatelessWidget {
  const Character_cust({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background pic-f.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // User info container
          Positioned(
            right: 10,
            top: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
            child: SizedBox(
              width: 120,
              height: 450,
              //   color: Colors.black38.withOpacity(0.7), // Example background color// Adjust height as needed
              // decoration: BoxDecoration(
              //   color: Colors.black38.withOpacity(0.7), // Example background color
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.5),
              //       offset: Offset(-10, 0), // Shadow position to the left
              //       blurRadius: 10.0,
              //     ),
              //   ],
              // ),
              child: GridView.count(
                crossAxisCount: 1, // Adjust as needed
                padding: const EdgeInsets.all(17),
                children: List.generate(7, (index) {
                  // Example grid items
                  return GestureDetector(
                    onTap: () {
                      // Function to execute when the grid button is clicked
                      print('Grid button $index clicked');
                      // You can replace the print statement with any action you want
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (const Color.fromRGBO(0,162,142,1)).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12), // Apply borderRadius to each grid item
                      ),
                      margin: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          'Option $index',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                 }
                ),
              ),
            ),
          ),
          ),
          // Positioned(
          //   right: 10,
          //   top: 60,
          //   child: Container(
          //     width: 170,
          //     height: 600, // Adjust height as needed
          //     color: Colors.black38.withOpacity(0.7), // Example background color
          //     child: GridView.count(
          //       crossAxisCount: 1, // Adjust as needed
          //       padding: EdgeInsets.all(17),
          //       children: List.generate(7, (index) {
          //         // Example grid items
          //         return Container(
          //           color: const Color.fromRGBO(0, 162, 142,1).withOpacity(0.7),
          //           margin: EdgeInsets.all(8),
          //           child: Center(
          //             child: Text(
          //               'Option $index',
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         );
          //       }),
          //     ),
          //   ),
          // ),
          // // Bottom navigation bar with notch
          Positioned(
            left: 10, // Adjust the left position as needed
            top: 200,
            right: 180,
            bottom: 180,// Adjust the top position as needed
            child: Container(
              width: 230,
              height: 350,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/animal.1.png'), // Replace 'assets/character_image.png' with your image path
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
