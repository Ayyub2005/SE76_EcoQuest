import 'package:flutter/material.dart';
import 'package:frontend/Pages/avatar_cust.dart';
import 'package:frontend/Pages/character_customization.dart';
import 'package:frontend/Pages/rotate_card.dart';
import 'package:frontend/login/screens/login_screen.dart';
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
  final Session session = Session(); // Step 1: Initialize the Session instance

  @override
  void initState() {
    super.initState();
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await session.loginUser(email, password); // Authenticate the user
      // Step 3: Fetch user data
      await session.fetchUserData(session.currentUser?.email ?? "");
    } catch (e) {
      print("Error logging in: $e");
    }
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
            Positioned(
              top: 15,
              left: 15,
              child: FutureBuilder<UserModel>(
                future: session.getCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }
                    UserModel user = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                                // Avatar
                                CircleAvatar(
                                  radius: 30,
                                  // ds['Avatar'].toString(),
                                ),
                                    const SizedBox(width: 10), // Spacing between avatar and text
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          child: Text(
                                                 '${user.name}!',

                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            // ),

            Positioned(
              top: 38.0,
              right: 20.0,
              child: Container(

                width: 130.0,
                height: 45.0,
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
                      top: 3.0,
                      right: 2.0,
                      bottom: 28.0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2.0),
                        ),
                        child: LinearPercentIndicator(
                          lineHeight: 20.0,
                          percent: 1.0,
                          padding: EdgeInsets.zero,
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
                      top: 25.0,
                      right: 2.0,
                      bottom: 3.0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2.0),
                        ),
                        child: LinearPercentIndicator(
                          lineHeight: 20.0,
                          percent: 1.0,
                          padding: EdgeInsets.zero,
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
              top: 200,
              bottom: 40,
              right: 0,
              child: Image.asset(
                'assets/output-onlinegiftools.gif',
                width: 200,

              ),
            ),

            Positioned(
              left: 20,
              top: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // First button without lock
                  FloatingActionButton(
                    onPressed: () {
                      // Add your action for button 1
                    },
                    backgroundColor: Color(0xFF058743),
                    child: Image.asset(
                      'assets/sugar.png',
                      // Replace with your actual image file name
                      width: 50,
                      height: 50,
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
                        child: Image.asset(
                          'assets/dances.png',
                          // Replace with your actual image file name
                          width: 50,
                          height: 50,
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
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Icon(Icons.lock, color: Colors.white),
                      // Lock icon overlay
                    ],
                  ),
                ],
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
                  color: Colors.black, width: 4.0),
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


