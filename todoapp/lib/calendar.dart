import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';

class calendarscreen extends StatefulWidget {
  const calendarscreen({Key? key}) : super(key: key);

  @override
  State<calendarscreen> createState() => _calendarscreenState();
}

class _calendarscreenState extends State<calendarscreen> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Add text "Calendar" to the top of the screen
          Text(
            'Calendar',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 120,
          ),

          Text(
            DateFormat('hh:mm:ss a').format(DateTime.now()),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 33,
          ),
          AnalogClock(
            hourHandColor: Colors.black,
            minuteHandColor: Colors.black,
            secondHandColor: Colors.black,
            dialColor: Colors.orange,
            dialBorderColor: Colors.black,
          ),
          Text(
            DateFormat('MMMM d, yyyy').format(currentDate),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            DateFormat('hh:mm a').format(currentDate),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
