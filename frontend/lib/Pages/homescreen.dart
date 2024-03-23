import 'package:flutter/material.dart';
import 'package:frontend/Pages/avatar_cust.dart';
import 'package:frontend/Pages/character_customization.dart';
import 'package:frontend/Pages/rotate_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:frontend/Pages/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Stream? userStream;

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Future<DocumentSnapshot> getontheload() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      return await FirebaseFirestore.instance.collection('User').doc(uid).get();
    } else {
      throw Exception("No user is currently logged in.");
    }
  }

  Widget userDetails() {
    return FutureBuilder<DocumentSnapshot>(
      future: getontheload(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          DocumentSnapshot ds = snapshot.data!;
          if (!ds.exists) {
            // Handle the case where the document does not exist
            return Text("User data not available.");
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Avatar
              CircleAvatar(
                radius: 30,
                // backgroundImage: NetworkImage(avatarUrl),
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
                      ds['XP'].toString(),
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
                      'Level:' + ds['XP'].toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  )
                ],
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
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
            userDetails(),
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

            Positioned(
              top: 38.0,
              right: 20.0,
              child: Container(

                width: 130.0,
                // Adjusted width to accommodate the heart image and the linear percentage indicators
                height: 45.0,
                // Adjusted height to accommodate both linear percentage indicators
                child: Stack(
                  children: [
                    // HP Indicator
                    Positioned(
                      left: 0.0,
                      top: 0.0,
                      child: Image.asset('assets/heart.png.png',
                          width: 24.0, height: 24.0),
                    ),
                    Positioned(
                      left: 30.0,
                      // Adjusted left position to create space for the heart image
                      top: 3.0,
                      // Adjusted top position to center the HP indicator vertically
                      right: 2.0,
                      // Adjusted right position to leave space for the border
                      bottom: 28.0,
                      // Adjusted bottom position to leave space for the border and XP indicator
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2.0),
                        ),
                        child: LinearPercentIndicator(
                          lineHeight: 20.0,
                          // Adjusted line height to match the height of the heart image
                          percent: 1.0,
                          padding: EdgeInsets.zero,
                          // Removed padding to ensure full width of the container
                          backgroundColor: Colors.black54,
                          progressColor: Colors.red,
                          animation: true,
                          animationDuration: 1000,
                        ),
                      ),
                    ),
                    // XP Indicator
                    Positioned(
                      left: 0.0,
                      top: 25.0,
                      child: Image.asset('assets/flash.png',
                          width: 24.0, height: 24.0),
                    ),
                    Positioned(
                      left: 30.0,
                      // Adjusted left position to create space for the heart image
                      top: 25.0,
                      // Adjusted top position to center the XP indicator vertically
                      right: 2.0,
                      // Adjusted right position to leave space for the border
                      bottom: 3.0,
                      // Adjusted bottom position to leave space for the border
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2.0),
                        ),
                        child: LinearPercentIndicator(
                          lineHeight: 20.0,
                          // Adjusted line height to match the height of the heart image
                          percent: 1.0,
                          padding: EdgeInsets.zero,
                          // Removed padding to ensure full width of the container
                          backgroundColor: Colors.black54,
                          progressColor: Colors.yellow,
                          animation: true,
                          animationDuration: 1000,
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),

            Positioned(
              left: 100,
              // Adjust as needed for spacing from the left edge
              top: 200,
              bottom: 40,
              right: 0,
              // Top and bottom set to 0 to center vertically
              child: Image.asset(
                'assets/output-onlinegiftools.gif',
                // Replace with your actual character image file
                width: 200, // Adjust width as needed

              ),
            ),

            Positioned(
              left: 20, // Distance from left edge
              top: 200, // Distance from top to start the buttons
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // First button without lock
                  FloatingActionButton(
                    onPressed: () {
                      // Add your action for button 1
                    },
                    backgroundColor: Color(0xFF058743), // Emerald green color
                    child: Image.asset(
                      'assets/sugar.png',
                      // Replace with your actual image file name
                      width: 50, // Adjust the size as needed
                      height: 50, // Adjust the size as needed
                    ),
                  ),
                  SizedBox(height: 20), // Space between buttons

                  // Second button with lock
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          // Add your action for button 2 (locked state action if necessary)
                        },
                        backgroundColor: Color(0xFF058743),
                        // Emerald green color
                        child: Image.asset(
                          'assets/dances.png',
                          // Replace with your actual image file name
                          width: 50, // Adjust the size as needed
                          height: 50, // Adjust the size as needed
                        ),
                      ),
                      // Lock icon overlay
                    ],
                  ),
                  SizedBox(height: 20), // Space between buttons

                  // Third button with lock
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          // Add your action for button 3 (locked state action if necessary)
                        },
                        backgroundColor: Color(0xFF058743),
                        // Emerald green color
                        child: Image.asset(
                          'assets/dances.png',
                          // Replace with your actual image file name
                          width: 50, // Adjust the size as needed
                          height: 50, // Adjust the size as needed
                        ),
                      ),
                      Icon(Icons.lock, color: Colors.white),
                      // Lock icon overlay
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20, // Adjust the left position as needed
              bottom: 20, // Adjust the bottom position as needed
              child: ElevatedButton(
                onPressed: () async {
                  String? uid = FirebaseAuth.instance.currentUser?.uid;
                  if (uid != null) {
                    Map<String, dynamic> userMap = {
                      "XP": 450
                    };
                    await DatabaseMethods().addUserData(userMap, uid);
                    print('Elevated Button Pressed');
                  } else {
                    print("User is not logged in.");
                    // Handle the case where the user is not logged in
                  }
                },
                child: Text('Customize'),
              ),
            ),
            // BottomAppBar(),

          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.black, width: 4.0), // Black border
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

//
// //CORRECT CODE
// class BottomAppBar extends StatefulWidget {
//   @override
//   _BottomAppBarState createState() => _BottomAppBarState();
// }
//
// class _BottomAppBarState extends State<BottomAppBar> {
//
//   int _selectedIndex = 0;
//
//   static const List<Widget> _widgetOptions = <Widget>[
//     CharacterCards(numCards: 2),
//     Character_cust(),
//     AvatartCust(),
//     HomeScreen(),
//
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: Colors.white),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.health_and_safety_rounded),
//             label: 'Characters',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person, color: Colors.white),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings, color: Colors.white),
//             label: 'Settings',
//           ),        ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.greenAccent,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }


// // class BottomAppBar extends StatefulWidget {
// //   @override
// //   _BottomAppBarState createState() => _BottomAppBarState();
// // }
// //
// // class _BottomAppBarState extends State<BottomAppBar> {
// //   int selectedIndex = 0;
// //
// //   List<Widget> screens = [
// //     HomeScreen(),
// //     CharacterCards(numCards: 2),
// //     Character_cust(),
// //     AvatartCust()
// //
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: screens[selectedIndex],
// //       bottomNavigationBar: BottomNavigationBar(
// //
// //         items: [
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home, color: Colors.white),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/dragon.png',
// //               width: 28,
// //               height: 28,
// //             ),
// //             label: 'Characters',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.person, color: Colors.white),
// //             label: 'Profile',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.settings, color: Colors.white),
// //             label: 'Settings',
// //           ),
// //         ],
// //         // onTap: (i) {
// //         //   setState(() {
// //         //     selectedIndex = i;
// //         //   });
// //         // },
// //         // currentIndex: selectedIndex,
// //       ),
// //     );
// //   }
// // }


}
class DisplayGIF extends StatefulWidget {
  const DisplayGIF({Key? key}) : super(key: key);

  @override
  _DisplayGIFState createState() => _DisplayGIFState();
}

class _DisplayGIFState extends State<DisplayGIF> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return isButtonPressed
        ? Image.asset(
      'assets/output-onlinegiftools.gif',
      width: 200,
    )
        : Image.asset(
      'assets/default_image.png', // Replace with your default image file
      width: 200,
    );
  }
}


