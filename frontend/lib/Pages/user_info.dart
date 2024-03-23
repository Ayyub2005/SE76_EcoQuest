// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light().copyWith(
//         bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.greenAccent,
//           unselectedItemColor: Colors.white,
//         ),
//       ),
//       home: const UserInfoPage(),
//     );
//   }
// }

// final _auth = FirebaseAuth.instance;
// final _db = FirebaseFirestore.instance;
// User? currentuser = FirebaseAuth.instance.currentUser;
// // final _authRepo = Get.put(AuthenticationRepositoy());

// class UserInfoPage extends StatelessWidget {
//   const UserInfoPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Top half background color
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height / 3 -
//                   20, // Third of screen height
//               color: Color.fromRGBO(0, 162, 142, 1),
//             ),
//           ),

//           // User info container
//           Positioned(
//             top: MediaQuery.of(context).size.height / 3,
//             left: 20,
//             child: const UserInfo(
//               avatarUrl: 'https://example.com/avatar.jpg',
//               userName: 'Senali Wij',
//               userLevel: 1,
//             ),
//           ),

//           Positioned(
//             top: MediaQuery.of(context).size.height / 3 + 3,
//             right: 20.0,
//             child: Container(
//               width:
//                   130.0, // Adjusted width to accommodate the heart image and the linear percentage indicators
//               height:
//                   45.0, // Adjusted height to accommodate both linear percentage indicators
//               child: Stack(
//                 children: [
//                   // HP Indicator
//                   Positioned(
//                     left: 0.0,
//                     top: 0.0,
//                     child: Image.asset('assets/heart.png.png',
//                         width: 24.0, height: 24.0),
//                   ),
//                   Positioned(
//                     left: 30.0,
//                     // Adjusted left position to create space for the heart image
//                     top: 3.0,
//                     // Adjusted top position to center the HP indicator vertically
//                     right: 2.0,
//                     // Adjusted right position to leave space for the border
//                     bottom: 28.0,
//                     // Adjusted bottom position to leave space for the border and XP indicator
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white70, width: 2.0),
//                       ),
//                       child: LinearPercentIndicator(
//                         lineHeight: 20.0,
//                         // Adjusted line height to match the height of the heart image
//                         percent: 1.0,
//                         padding: EdgeInsets.zero,
//                         // Removed padding to ensure full width of the container
//                         backgroundColor: Colors.black54,
//                         progressColor: Colors.red,
//                         animation: true,
//                         animationDuration: 1000,
//                       ),
//                     ),
//                   ),
//                   // XP Indicator
//                   Positioned(
//                     left: 0.0,
//                     top: 25.0,
//                     child: Image.asset('assets/flash.png',
//                         width: 24.0, height: 24.0),
//                   ),
//                   Positioned(
//                     left: 30.0,
//                     // Adjusted left position to create space for the heart image
//                     top: 25.0,
//                     // Adjusted top position to center the XP indicator vertically
//                     right: 2.0,
//                     // Adjusted right position to leave space for the border
//                     bottom: 3.0,
//                     // Adjusted bottom position to leave space for the border
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white70, width: 2.0),
//                       ),
//                       child: LinearPercentIndicator(
//                         lineHeight: 20.0,
//                         // Adjusted line height to match the height of the heart image
//                         percent: 1.0,
//                         padding: EdgeInsets.zero,
//                         // Removed padding to ensure full width of the container
//                         backgroundColor: Colors.black54,
//                         progressColor: Colors.yellow,
//                         animation: true,
//                         animationDuration: 1000,
//                       ),
//                     ),
//                   ),
//                 ],

//                 // width: 120.0,
//                 // decoration: BoxDecoration(
//                 //     border: Border.all(color: Colors.white70, width: 2.5),
//                 //     borderRadius: BorderRadius.circular(8.0) // Add border
//                 //     ),
//                 // child: ClipRRect(
//                 //   // Use ClipRRect to clip the child widget to fit within the container
//                 //   borderRadius: BorderRadius.circular(
//                 //       10.0), // Adjust border radius as needed
//                 //   child: LinearPercentIndicator(
//                 //     lineHeight: 14.0,
//                 //     percent: 0.5,
//                 //     padding: const EdgeInsets.symmetric(
//                 //         horizontal:
//                 //             2.0), // Adjust padding to keep indicator within the border
//                 //     backgroundColor: Colors.black54,
//                 //     progressColor: Colors.red,
//                 //     animation: true,
//                 //     animationDuration: 1000,
//                 //   ),
// // >>>>>>> 13326047687a81a9add6c4acc310a9583082fd96
//               ),
//             ),
//           ),

//           //Display User Information
//           Positioned(
//             top: MediaQuery.of(context).size.height / 3 + 75,
//             left: 20,
//             right: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Name:           }',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Divider(color: Colors.grey),
//                       Text(
//                         'Email:            senali@example.com',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Divider(color: Colors.grey),
//                       Text(
//                         'Password:    ********',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Divider(color: Colors.grey),
//                       Text(
//                         'XP Level:       1',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Update Password Button
//           Positioned(
//             top: MediaQuery.of(context).size.height / 3 +
//                 270, // Adjust position as needed
//             left: 20,
//             right: 20,
//             child: Container(
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add functionality for updating password
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     // Adjust the shape here
//                     borderRadius: BorderRadius.circular(
//                         8), // Set the border radius as needed
//                   ),
//                 ),
//                 child: Text('Update Password'),
//               ),
//             ),
//           ),

//           // Delete Account Button
//           Positioned(
//             top: MediaQuery.of(context).size.height / 3 +
//                 330, // Adjust position as needed
//             left: 20,
//             right: 20,
//             child: Container(
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add functionality for deleting account
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.red,
//                   shape: RoundedRectangleBorder(
//                     // Adjust the shape here
//                     borderRadius: BorderRadius.circular(
//                         8), // Set the border radius as needed
//                   ),
//                 ),
//                 child: Text('Delete Account'),
//               ),
//             ),
//           ),

//           // Bottom navigation bar with notch
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: BottomAppBar(
//               color: Colors.black,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   IconButton(
//                     iconSize: 32,
//                     icon: const Icon(Icons.home, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Image.asset(
//                       'assets/dragon.png',
//                       width: 30,
//                       height: 30,
//                     ),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     iconSize: 32,
//                     icon: const Icon(Icons.person, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     iconSize: 32,
//                     icon: const Icon(Icons.settings, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 55.0),
//         child: Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(color: Colors.black, width: 4.0), // Black border
//           ),
//           child: const ClipOval(
//             child: Material(
//               color: Colors.white,
//               child: Icon(
//                 Icons.camera_alt_outlined,
//                 size: 36,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

// class UserInfo extends StatelessWidget {
//   final String avatarUrl;
//   final String userName;
//   final int userLevel;

//   const UserInfo({
//     Key? key,
//     required this.avatarUrl,
//     required this.userName,
//     required this.userLevel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         // Avatar
//         CircleAvatar(
//           radius: 30,
//           backgroundImage: NetworkImage(avatarUrl),
//         ),
//         const SizedBox(width: 20), // Spacing between avatar and text
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Name
//             Container(
//               padding: const EdgeInsets.all(4),
//               decoration: const BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//               child: Text(
//                 userName,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ), // Vertical spacing between name and level
//             // Level
//             Container(
//               padding: const EdgeInsets.all(4),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//               // child: Text(
//               //   'Level: $userLevel',
//               //   style: const TextStyle(
//               //     fontSize: 12,
//               //     fontWeight: FontWeight.bold,
//               //     color: Colors.white,
//               //   ),
//               // ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class GetUserInfo {
//   final String name;
//   final String email;
//   final String password;

//   const GetUserInfo({
//     required this.name,
//     required this.email,
//     required this.password,
//     required,
//   });

//   toJson() {
//     return {"Name": name, "Email": email, "password": password};
//   }

//   factory GetUserInfo.fromsnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return GetUserInfo(
//       name: data["name"],
//       email: data["Email"],
//       password: data["Password"],
//     );
//   }
// }

// Future<GetUserInfo> getUserDetails(String email) async {
//   final snapshot =
//       await _db.collection("Users").where("Email", isEqualTo: email).get();
//   final userData = snapshot.docs.map((e) => GetUserInfo.fromsnapshot(e)).single;
//   return userData;
// }

// getUserData() {
//   if (currentuser != null) {
//     final email = currentuser?.email;
//     if (email != null) {
//       getUserDetails(email);
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white,
        ),
      ),
      home: const UserInfoPage(),
    );
  }
}

final _auth = FirebaseAuth.instance;
final _db = FirebaseFirestore.instance;
User? currentuser = FirebaseAuth.instance.currentUser;

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late Future<GetUserInfo> _userDataFuture;

  @override
  void initState() {
    super.initState();
    _userDataFuture = getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top half background color
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 3 - 20,
              color: const Color.fromRGBO(0, 162, 142, 1),
            ),
          ),

          // User info container
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: 20,
            child: UserInfo(
              avatarUrl: 'https://example.com/avatar.jpg',
              userName: 'Senali Wij', // Placeholder name until data is fetched
              userLevel: 1,
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 3,
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

          // Display User Information
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 75,
            left: 20,
            right: 20,
            child: FutureBuilder<GetUserInfo>(
              future: _userDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator while fetching data
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final userData = snapshot.data!;
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${userData.name}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(color: Colors.grey),
                      Text(
                        'Email: ${userData.email}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(color: Colors.grey),
                      Text(
                        'Password: ${userData.password}', // Displaying password is not recommended for security reasons
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(color: Colors.grey),
                      Text(
                        'XP Level: ${userData.userLevel}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Update Password Button
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 270,
            left: 20,
            right: 20,
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for updating password
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Update Password'),
              ),
            ),
          ),

          // Delete Account Button
          Positioned(
            top: MediaQuery.of(context).size.height / 3 + 330,
            left: 20,
            right: 20,
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for deleting account
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Delete Account'),
              ),
            ),
          ),

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
            border: Border.all(color: Colors.black, width: 4.0),
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

  Future<GetUserInfo> getUserData() async {
    final email = currentuser?.email;
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData =
        snapshot.docs.map((e) => GetUserInfo.fromSnapshot(e)).single;
    return userData;
  }
}

class UserInfo extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final int userLevel;

  const UserInfo({
    Key? key,
    required this.avatarUrl,
    required this.userName,
    required this.userLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(width: 20), // Spacing between avatar and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ), // Vertical spacing between name and level
          ],
        ),
      ],
    );
  }
}

class GetUserInfo {
  final String name;
  final String email;
  final String password;
  final int userLevel;

  const GetUserInfo({
    required this.name,
    required this.email,
    required this.password,
    required this.userLevel,
  });

  factory GetUserInfo.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return GetUserInfo(
      name: data["Name"],
      email: data["Email"],
      password: data["Password"],
      userLevel: data["XP Level"],
    );
  }
}
