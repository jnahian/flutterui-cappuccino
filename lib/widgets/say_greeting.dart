import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';

class SayGreeting extends StatefulWidget {
  const SayGreeting({Key? key}) : super(key: key);

  @override
  _SayGreetingState createState() => _SayGreetingState();
}

class _SayGreetingState extends State<SayGreeting> {
  String greeting = '';

  @override
  void initState() {
    super.initState();
    updateGreeting();
    Timer.periodic(Duration(minutes: 1), (Timer t) => updateGreeting());
  }

  void updateGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    String newGreeting;
    if (hour >= 5 && hour < 12) {
      newGreeting = 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      newGreeting = 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      newGreeting = 'Good Evening';
    } else {
      newGreeting = 'Good Night';
    }

    setState(() {
      greeting = newGreeting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      greeting,
      style: GoogleFonts.sourceSans3(fontWeight: FontWeight.bold, color: ColorPalette().coffeeSelected, fontSize: 17.0),
    );
  }
}
