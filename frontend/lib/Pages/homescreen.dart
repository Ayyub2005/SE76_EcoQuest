import 'package:flutter/material.dart';
//import 'package:frontend/Pages/character_cards.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This variable holds the currently displayed image
  String displayedImage = 'assets/dog-character_default.png';
  Key gifKey = UniqueKey();


  void changeDisplayedImage(String imagePath, int duration) {
    setState(() {
      displayedImage = imagePath;
    });

    Future.delayed(Duration(milliseconds: duration), () {
      setState(() {
        displayedImage = 'assets/dog-character_default.png'; // Change back to the default image
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/backgground.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // User info container
          // const Positioned(
          //   top: 35,
          //   left: 20,
          //   child: UserInfo(
          //     avatarUrl: 'https://example.com/avatar.jpg',
          //     userName: 'Senali Wij',
          //     userLevel: 1,
          //   ),
          // ),

          // Positioned(
          //   top: 38.0,
          //   right: 20.0,
          //   child: Container(
          //
          //     width: 130.0, // Adjusted width to accommodate the heart image and the linear percentage indicators
          //     height: 45.0, // Adjusted height to accommodate both linear percentage indicators
          //     child: Stack(
          //       children: [
          //         // HP Indicator
          //         Positioned(
          //           left: 0.0,
          //           top: 0.0,
          //           child: Image.asset('assets/hearts.png',
          //               width: 24.0, height: 24.0),
          //         ),
          //         Positioned(
          //           left: 30.0,
          //           // Adjusted left position to create space for the heart image
          //           top: 3.0,
          //           // Adjusted top position to center the HP indicator vertically
          //           right: 2.0,
          //           // Adjusted right position to leave space for the border
          //           bottom: 28.0,
          //           // Adjusted bottom position to leave space for the border and XP indicator
          //           child: Container(
          //             decoration: BoxDecoration(
          //               border: Border.all(color: Colors.white70, width: 2.0),
          //             ),
          //             child: LinearPercentIndicator(
          //               lineHeight: 20.0,
          //               // Adjusted line height to match the height of the heart image
          //               percent: 1.0,
          //               padding: EdgeInsets.zero,
          //               // Removed padding to ensure full width of the container
          //               backgroundColor: Colors.black54,
          //               progressColor: Colors.red,
          //               animation: true,
          //               animationDuration: 1000,
          //             ),
          //           ),
          //         ),
          //         // XP Indicator
          //         Positioned(
          //           left: 0.0,
          //           top: 25.0,
          //           child: Image.asset('assets/flash.png',
          //               width: 24.0, height: 24.0),
          //         ),
          //         Positioned(
          //           left: 30.0,
          //           // Adjusted left position to create space for the heart image
          //           top: 25.0,
          //           // Adjusted top position to center the XP indicator vertically
          //           right: 2.0,
          //           // Adjusted right position to leave space for the border
          //           bottom: 3.0,
          //           // Adjusted bottom position to leave space for the border
          //           child: Container(
          //             decoration: BoxDecoration(
          //               border: Border.all(color: Colors.white70, width: 2.0),
          //             ),
          //             child: LinearPercentIndicator(
          //               lineHeight: 20.0,
          //               // Adjusted line height to match the height of the heart image
          //               percent: 1.0,
          //               padding: EdgeInsets.zero,
          //               // Removed padding to ensure full width of the container
          //               backgroundColor: Colors.black54,
          //               progressColor: Colors.yellow,
          //               animation: true,
          //               animationDuration: 1000,
          //             ),
          //           ),
          //         ),
          //       ],

                // width: 120.0,
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.white70, width: 2.5),
                //     borderRadius: BorderRadius.circular(8.0) // Add border
                //     ),
                // child: ClipRRect(
                //   // Use ClipRRect to clip the child widget to fit within the container
                //   borderRadius: BorderRadius.circular(
                //       10.0), // Adjust border radius as needed
                //   child: LinearPercentIndicator(
                //     lineHeight: 14.0,
                //     percent: 0.5,
                //     padding: const EdgeInsets.symmetric(
                //         horizontal:
                //             2.0), // Adjust padding to keep indicator within the border
                //     backgroundColor: Colors.black54,
                //     progressColor: Colors.red,
                //     animation: true,
                //     animationDuration: 1000,
                //   ),
// >>>>>>> 13326047687a81a9add6c4acc310a9583082fd96
//               ),
//             ),
//           ),

          Positioned(
            left: 80,

            top: 200,
            bottom: 40,
            right: 0,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Image.asset(
                displayedImage,
                key: ValueKey(displayedImage),
                width: 400,
                height: 400,
              ),
            ),
          ),


          // Positioned(
          //   left: 80,
          //   // Adjust as needed for spacing from the left edge
          //   top: 200,
          //   bottom: 40,
          //   right: 0,
          //   // Top and bottom set to 0 to center vertically
          //   child: Image.asset(
          //     'assets/output-onlinegiftools.gif',
          //     // Replace with your actual character image file
          //     width: 200, // Adjust width as needed
          //
          //   ),
          // ),

          // Positioned(
          //   left: 100,
          //   top: 200,
          //   bottom: 40,
          //   right: 0,
          //   child: DisplayGIF(),
          // ),

          Positioned(
              left: 20,
              top: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Button 1 - Display gif1
                  FloatingActionButton(
                    onPressed: () {
                      changeDisplayedImage('assets/output-onlinegiftools.gif', 2500);
                    },
                    backgroundColor: Color(0xFF058743),
                    child: Image.asset(
                      'assets/sugar.png',
                      width: 150,
                      height: 150,
                      key: gifKey, // Pass the gifKey here
                    ),
                  ),

                  SizedBox(height: 20), // Space between buttons

                  // Button 2 - Display gif2



                  FloatingActionButton(
                    onPressed: () {
                      changeDisplayedImage('assets/heart1.gif', 2400);
                    },
                    backgroundColor: Color(0xFF058743),

                    child: Image.asset(
                      'assets/hed.png',
                      width: 250,
                      height: 250,


                    ),


                  ),
                  SizedBox(height: 20), // Space between buttons

                  // Third button with lock
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          // Show a dialog notification when the button is pressed
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center( // Center the title
                                  child: Text(
                                    'Unlock at level 7',
                                    style: TextStyle(fontSize: 14), // Adjust font size
                                  ),
                                ),
                                content: Container(
                                  height: 8, // Adjust height
                                ),
                                actions: [
                                  Center( // Center the button
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(fontSize: 12), // Adjust font size
                                      ),
                                    ),
                                  ),
                                ],
                                contentPadding: EdgeInsets.all(5), // Adjust padding
                              );
                            },
                          );
                        },
                        backgroundColor: Color(0xFF058743),

                        child: Image.asset(
                          'assets/dances.png',
                          width: 50,
                          height: 50,

                        ),
                      ),
                      Icon(Icons.lock, color: Colors.white),

                    ],
                  ),
                ],

              )),

          // Bottom navigation bar with notch
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      Navigator.pop(context);
                    },
                  ),

                  IconButton(
                    icon: Image.asset(
                      'assets/dragon.png',
                      width: 30,
                      height: 30,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     // context,
                      //     // MaterialPageRoute(builder: (context) => characterCards(numCards: 4))
                      // );
                    },
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.settings, color: Colors.white),
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

class UserInfo extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final int userLevel;

  const UserInfo(
      {super.key,
        required this.avatarUrl,
        required this.userName,
        required this.userLevel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Avatar
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(width: 10), // Spacing between avatar and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                userName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            // Vertical spacing between name and level
            // Level
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                'Level: $userLevel',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
// class DisplayGIF extends StatefulWidget {
//   const DisplayGIF({Key? key}) : super(key: key);
//
//   @override
//   _DisplayGIFState createState() => _DisplayGIFState();
// }
//
// class _DisplayGIFState extends State<DisplayGIF> {
//   bool isButtonPressed = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return isButtonPressed
//         ? Image.asset(
//       'assets/output-onlinegiftools.gif',
//       width: 200,
//     )
//         : Image.asset(
//       'assets/default_image.png', // Replace with your default image file
//       width: 200,
//     );
//   }
// }