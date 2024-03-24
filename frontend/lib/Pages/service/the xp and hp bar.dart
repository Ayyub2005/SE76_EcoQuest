import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
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
      home: ProgressBars(),
    );
  }
}

class ProgressBars extends StatefulWidget {
  const ProgressBars({Key? key}) : super(key: key);

  @override
  _ProgressBarsState createState() => _ProgressBarsState();
}

class _ProgressBarsState extends State<ProgressBars> {
  double xp = 0.0; // Initial XP value
  double hp = 0.5; // Initial HP value
  late Timer _timer;
  static const int hpReductionIntervalInMinutes = 5; // Interval for HP reduction

  @override
  void initState() {
    super.initState();
    // Load HP from SharedPreferences or set default
    _loadHP();
    // Start timer to reduce HP over time
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel(); // Cancel timer to avoid memory leaks
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      // Reduce HP periodically
      setState(() {
        hp -= 1 / (hpReductionIntervalInMinutes * 2); // 50% HP reduction in hpReductionIntervalInMinutes minutes
        if (hp < 0) {
          hp = 0; // Ensure HP doesn't go below 0
        }
      });
      // Save HP to SharedPreferences
      _saveHP();
    });
  }

  void _loadHP() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      hp = prefs.getDouble('hp') ?? 0.5; // Default to 50%
    });
  }

  void _saveHP() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('hp', hp);
  }

  void increaseXP() {
    setState(() {
      // Increase XP by 12%
      xp += 0.10;
      if (xp > 1.0) {
        xp = 1.0; // Cap XP at 100%
      }
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
          // HP Indicator
          Positioned(
            top: 38.0,
            right: 20.0,
            child: Container(
              width: 130.0,
              height: 45.0,
              child: Stack(
                children: [
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    child: Image.asset('assets/hearts.png',
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
                        percent: hp,
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.black54,
                        progressColor: Colors.red,
                        animation: true,
                        animationDuration: 1000,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // XP Indicator
          Positioned(
            top: 38.0,
            right: 20.0,
            child: Container(
              width: 130.0,
              height: 45.0,
              child: Stack(
                children: [
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
                        percent: xp,
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          increaseXP(); // Call function to increase XP
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


