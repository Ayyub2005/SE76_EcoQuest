import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  PageOne(),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            'assets/page1-bg.jpg',
            fit: BoxFit.cover,
          ),
          ),
          // Positioned.fill(
          //   child: Container(
          //     color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
          //   ),
          // ),
          Center(
            child: Image.asset(
              'assets/Logo-final.png'
            ),
          )
        ],
      ),
    );
  }
}