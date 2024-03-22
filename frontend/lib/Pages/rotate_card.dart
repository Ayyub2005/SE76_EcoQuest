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
      home: const CharacterCards(numCards: 3), // Set the number of cards here
    );
  }
}

class CharacterCards extends StatefulWidget {
  final int numCards;

  const CharacterCards({super.key, required this.numCards});

  @override
  _CharacterCardsState createState() => _CharacterCardsState();
}

class _CharacterCardsState extends State<CharacterCards> with SingleTickerProviderStateMixin {
  late List<bool> cardUnlocked;
  late List<String> cardContents;
  late List<Map<String, String>> cardDetails;
  late AnimationController _controller;
  late List<bool> _isCardFlippedList;
  late PageController _pageController; // Add this line
  int _currentPage = 0; // Add this line to track the current page index

  @override
  void initState() {
    super.initState();
    initializeCards();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _isCardFlippedList = List<bool>.filled(widget.numCards, false);
    _pageController = PageController()..addListener(() { // Initialize and add listener
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose(); // Dispose the PageController
    super.dispose();
  }

  void initializeCards() {
    // Initialize card details using data from card_data.dart
    cardDetails = CardData.cardDetails;

    // Initialize card contents
    cardContents = List<String>.generate(widget.numCards, (index) => "Text for card ${index + 1}");

    // Initialize card unlocked status
    cardUnlocked = List<bool>.generate(widget.numCards, (index) => index != widget.numCards - 1); // Last card is locked, others are unlocked
  }

  void _toggleCardFlip(int index) {
    if (cardUnlocked[index]) { // Check if the card is unlocked
      setState(() {
        _isCardFlippedList[index] = !_isCardFlippedList[index]; // Toggle the flipped state of the tapped card
      });
      if (_isCardFlippedList[index]) {
        _controller.forward(from: 0.0);
      } else {
        _controller.reverse(from: 1.0);
      }
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 3 * 2,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: cardContents.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3 * 2,
                          height: MediaQuery.of(context).size.height / 2,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () => _toggleCardFlip(index),
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, child) {
                                    final angle = (_isCardFlippedList[index] ? 1 - _controller.value : _controller.value) * 3.14;
                                    return Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.002)
                                        ..rotateY(angle),
                                      alignment: Alignment.center,
                                      child: child,
                                    );
                                  },
                                  child: Card(
                                    color: const Color.fromRGBO(142, 169, 185, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    elevation: 4.0,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          if (!_isCardFlippedList[index])
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20.0),
                                              child: Text(
                                                '${cardDetails[index]['name']}',
                                                style: const TextStyle(fontSize: 25.0),
                                              ),
                                            ),
                                          if (!_isCardFlippedList[index])
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              height: MediaQuery.of(context).size.height / 3,
                                              child: Image.asset(
                                                'assets/character_${index + 1}.jpeg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (_isCardFlippedList[index])
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Care Level: ${cardDetails[index]['careLevel']}',
                                                      style: const TextStyle(fontSize: 18.0),
                                                    ),
                                                    Text(
                                                      'Nutrition Favorite: ${cardDetails[index]['nutritionFavorite']}',
                                                      style: const TextStyle(fontSize: 18.0),
                                                    ),
                                                    SizedBox(height: 20),
                                                    if (_isCardFlippedList[index])
                                                      Positioned.fill(
                                                        child: Align(
                                                          alignment: Alignment.bottomCenter,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 100), // Adjust as needed
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed: () {},
                                                                  style: ButtonStyle(
                                                                    // backgroundColor: MaterialStateProperty.all(Color.fromRGBO(5,15,21,255)), // Change button color here
                                                                    foregroundColor: MaterialStateProperty.all(Colors.cyan), // Change text color here
                                                                    minimumSize: MaterialStateProperty.all(Size(120, 40)),
                                                                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
                                                                  ),
                                                                  child: Text('Customize'),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed: () {},
                                                                  style: ButtonStyle(
                                                                    // backgroundColor: MaterialStateProperty.all(Color.fromRGBO(5,15,21,255)), // Change button color here
                                                                    foregroundColor: MaterialStateProperty.all(Colors.cyan), // Change text color here
                                                                    minimumSize: MaterialStateProperty.all(Size(130, 40)),
                                                                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
                                                                  ),
                                                                  child: Text('Select'),
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
                              if (!cardUnlocked[index]) // Show translucent div if the card is locked
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0), // Same borderRadius as the card
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  // width: MediaQuery.of(context).size.width / 3,
                                  // height: MediaQuery.of(context).size.height / 4,
                                  child: Center(
                                      child:Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                        size:100 ,
                                      )
                                  ),
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
                if (widget.numCards > 1) // Conditionally display the "Scroll Sideways to View" text
                  Text(
                    'Scroll Sideways to View',
                    style: TextStyle(color: Colors.white),
                  ),
              ],
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
