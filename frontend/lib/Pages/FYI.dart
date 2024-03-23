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
      home: FYI(),
    );
  }
}

class FYI extends StatefulWidget {
  @override
  _FYIState createState() => _FYIState();
}

class _FYIState extends State<FYI> with SingleTickerProviderStateMixin {
  late List<Map<String, String>> cardDetails;
  late AnimationController _controller;
  late bool _isCardFlipped;
  int currentIndex = 3; // Variable to track the current card index

  @override
  void initState() {
    super.initState();
    initializeCards();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _isCardFlipped = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initializeCards() {
    // Initialize card details using data from card_data.dart
    cardDetails = CardData.cardDetails;
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
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: _toggleCardFlip,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final angle = (_isCardFlipped ? 1 - _controller.value : _controller.value) * 3.14;
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateY(angle),
                          alignment: Alignment.center,
                          child: child,
                        );
                      },
                      child: Card(
                        color: const Color.fromRGBO(0, 162, 142, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (!_isCardFlipped)
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    '${cardDetails[currentIndex]['name']}',
                                    style: const TextStyle(fontSize: 25.0),
                                  ),
                                ),
                              if (!_isCardFlipped)
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.height / 4,
                                  child: Image.asset(
                                    'assets/character_${currentIndex + 1}.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              if (_isCardFlipped)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Care Level: ${cardDetails[currentIndex]['careLevel']}',
                                          style: const TextStyle(fontSize: 18.0),
                                        ),
                                        SizedBox(height: 20),
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
