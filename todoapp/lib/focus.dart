import 'package:flutter/material.dart';

class FocusView extends StatelessWidget {
  const FocusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "focusview",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
