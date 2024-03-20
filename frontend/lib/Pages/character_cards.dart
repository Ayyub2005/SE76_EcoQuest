import 'package:flutter/material.dart';
import 'card_data.dart';

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
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white,
        ),
      ),
      home: const HomeScreen(numCards: 4), // Set the number of cards here
    );
  }
}

class HomeScreen extends StatefulWidget {
  final int numCards;

  const HomeScreen({Key? key, required this.numCards}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<bool> cardUnlocked;
  late List<String> cardContents;
  late List<Map<String, String>> cardDetails;

  @override
  void initState() {
    super.initState();
    initializeCards();
  }

  void initializeCards() {
    // Initialize card details using data from card_data.dart
    cardDetails = CardData.cardDetails;

    // Initialize card contents
    cardContents = List<String>.generate(widget.numCards, (index) => "Text for card ${index + 1}");

    // Initialize card unlocked status
    cardUnlocked = List<bool>.generate(widget.numCards, (index) => index != widget.numCards - 1); // Last card is locked, others are unlocked
  }

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

          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 3 * 2,
              child: PageView.builder(
                controller: PageController(viewportFraction: 1.0),
                itemCount: cardContents.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3 * 2,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Stack(
                        children: [
                          Card(
                            color:  const Color.fromRGBO(0, 162, 142, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 4.0,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${cardDetails[index]['name']}',
                                    style: const TextStyle(fontSize: 25.0),
                                  ),
                                  // Image of the character
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.height / 4,
                                    child: Image.asset(
                                      'assets/character_${index + 1}.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Care Level: ${cardDetails[index]['careLevel']}',
                                          style: const TextStyle(fontSize: 18.0),
                                        ),
                                        Text(
                                          'Nutrition Favorite: ${cardDetails[index]['nutritionFavorite']}',
                                          style: const TextStyle(fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!cardUnlocked[index]) // Show translucent div if the card is locked
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0), // Same borderRadius as the card
                                color: Colors.black.withOpacity(0.5),
                              ),
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 4,
                              child: Center(
                                child: Image.asset(
                                  'assets/locked_icon.png', // Add your locked icon image path here
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.height / 4,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
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
