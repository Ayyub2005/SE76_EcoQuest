import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageOne(),
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the fading animation after 1 second (1000 milliseconds)
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/page1-bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              child: Image.asset(
                'assets/Logo-final.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
