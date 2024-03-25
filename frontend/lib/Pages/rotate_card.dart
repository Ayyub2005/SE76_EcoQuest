import 'package:flutter/material.dart';
import 'package:frontend/Pages/character_customization.dart';
import 'card_data.dart';
import 'package:frontend/Pages/Navigation.dart';
import 'navigation.dart';
import 'package:frontend/Pages/service/database.dart';
// import 'package:flutter/src/material/bottom_app_bar.dart';
// import 'package:frontend/Pages/Navigation.dart';

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
      home: const CharacterCards(), // Set the number of cards here
    );
  }
}

class CharacterCards extends StatefulWidget {
  const CharacterCards({super.key});

  @override
  _CharacterCardsState createState() => _CharacterCardsState();
}

class _CharacterCardsState extends State<CharacterCards>
    with SingleTickerProviderStateMixin {
  late List<bool> cardUnlocked;
  late List<String> cardContents;
  late List<Map<String, String>> cardDetails;
  late AnimationController _controller;
  late bool _isCardFlipped;
  late int numCards = 1;

  @override
  void initState() {
    super.initState();
    initializeCards();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _isCardFlipped = false;
    fetchCharacterFromDatabase();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void fetchCharacterFromDatabase() async {
    try {
      UserModel currentUser =
          await Session().getCurrentUser(); // Fetch current user
      if (currentUser != null) {
        setState(() {
          numCards = currentUser.character +
              1; // Set numCards based on the character field in the database
          initializeCards(); // Reinitialize cards based on the updated numCards value
        });
      } else {
        print("Current user is null.");
      }
    } catch (e) {
      print("Error fetching character from database: $e");
    }
  }

  void initializeCards() {
    // Initialize card details using data from card_data.dart
    cardDetails = CardData.cardDetails;

    // Initialize card contents
    cardContents = List<String>.generate(
        numCards, (index) => "Text for card ${index + 1}");

    // Initialize card unlocked status
    cardUnlocked = List<bool>.generate(
        numCards,
        (index) =>
            index != numCards - 1); // Last card is locked, others are unlocked
  }

  void _toggleCardFlip() {
    setState(() {
      _isCardFlipped = !_isCardFlipped;
    });
    if (_isCardFlipped) {
      _controller.forward(from: 0.0);
    } else {
      _controller.reverse(from: 1.0);
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
              'assets/background6.png',
              fit: BoxFit.cover,
            ),
          ),
          // User info container

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
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
                              GestureDetector(
                                onTap: () => _toggleCardFlip(),
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, child) {
                                    final angle = (_isCardFlipped
                                            ? 1 - _controller.value
                                            : _controller.value) *
                                        3.14;
                                    return Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.002)
                                        ..rotateY(angle),
                                      alignment: Alignment.center,
                                      child: child,
                                    );
                                  },
                                  child: Card(
                                    color:
                                        const Color.fromRGBO(142, 169, 185, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    elevation: 4.0,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (!_isCardFlipped)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Text(
                                                '${cardDetails[index]['name']}',
                                                style: const TextStyle(
                                                    fontSize: 25.0),
                                              ),
                                            ),
                                          if (!_isCardFlipped)
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              child: Image.asset(
                                                'assets/character_${index + 1}.jpeg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (_isCardFlipped)
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20.0,
                                                        horizontal: 0.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Care Level: ${cardDetails[index]['careLevel']}',
                                                      style: const TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                    Text(
                                                      'Nutrition Favorite: ${cardDetails[index]['nutritionFavorite']}',
                                                      style: const TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                    SizedBox(height: 20),
                                                    if (_isCardFlipped)
                                                      Positioned.fill(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top:
                                                                        100), // Adjust as needed
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                        Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(builder: (context) =>Character_cust(),
                                                                          ),
                                                                        );
                                                                      },
                                                                  style:
                                                                      ButtonStyle(
                                                                    // backgroundColor: MaterialStateProperty.all(Color.fromRGBO(5,15,21,255)), // Change button color here
                                                                    foregroundColor:
                                                                        MaterialStateProperty.all(
                                                                            Colors.cyan), // Change text color here
                                                                    minimumSize:
                                                                        MaterialStateProperty.all(Size(
                                                                            120,
                                                                            40)),
                                                                    textStyle: MaterialStateProperty.all(TextStyle(
                                                                        fontSize:
                                                                            16)),
                                                                  ),
                                                                  child: Text(
                                                                      'Customize'),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style:
                                                                      ButtonStyle(
                                                                    // backgroundColor: MaterialStateProperty.all(Color.fromRGBO(5,15,21,255)), // Change button color here
                                                                    foregroundColor:
                                                                        MaterialStateProperty.all(
                                                                            Colors.cyan), // Change text color here
                                                                    minimumSize:
                                                                        MaterialStateProperty.all(Size(
                                                                            130,
                                                                            40)),
                                                                    textStyle: MaterialStateProperty.all(TextStyle(
                                                                        fontSize:
                                                                            16)),
                                                                  ),
                                                                  child: Text(
                                                                      'Select'),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (!cardUnlocked[
                                  index]) // Show translucent div if the card is locked
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        16.0), // Same borderRadius as the card
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  // width: MediaQuery.of(context).size.width / 3,
                                  // height: MediaQuery.of(context).size.height / 4,
                                  child: Center(
                                      child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 100,
                                  )),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'You have ${cardUnlocked.where((unlocked) => unlocked).length} unlocked',
                  style: TextStyle(color: Colors.white),
                ),
                if (numCards >
                    1) // Conditionally display the "Scroll Sideways to View" text
                  Text(
                    'Scroll Sideways to View',
                    style: TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
