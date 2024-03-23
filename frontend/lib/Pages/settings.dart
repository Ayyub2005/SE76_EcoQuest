import 'package:flutter/material.dart';

void main() {
  runApp(InstructionsPage());
}

class InstructionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Game Instructions'),
        ),

      ),
    );
  }
}

