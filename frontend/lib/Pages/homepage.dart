import 'package:flutter/material.dart';
import 'package:frontend/Pages/avatar_cust.dart';
import 'package:frontend/Pages/character_customization.dart';
import 'package:frontend/Pages/rotate_card.dart';
import 'package:frontend/Pages/service/database.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String displayedImage = 'assets/dog.png'; // This variable holds the currently displayed image
  Key gifKey = UniqueKey();
  final Session session = Session();

  @override
  void initState() {
    super.initState();
  }
  void changeDisplayedImage(String imagePath, int duration) {
    setState(() {
      displayedImage = imagePath;
    });

    Future.delayed(Duration(milliseconds: duration), () {
      setState(() {
        displayedImage = 'assets/dog.png'; // Change back to the default image
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
          Positioned(
            top: 50,
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
                        child: Image.asset(
                          'assets/avatar${user.avatar}.png',
                        ),

                      ),
                      const SizedBox(width: 10),
                      // Spacing between avatar and text
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

          Positioned(
            left: 90,
            top: 200,
            bottom: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Image.asset(
                displayedImage,
                key: ValueKey(displayedImage),
                width: 600,
                height: 600,
              ),
            ),
          ),

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
                      width: 600,
                      height: 600,
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
              ),
          ),
        ],
      ),
    );
  }
}
