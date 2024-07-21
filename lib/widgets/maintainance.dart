import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';

class Maintainance extends StatefulWidget {
  const Maintainance({Key? key}) : super(key: key);

  @override
  State<Maintainance> createState() => _MaintainanceState();
}

class _MaintainanceState extends State<Maintainance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/beansbottom.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Maintanance!',
              style: GoogleFonts.sourceSans3(
                color: ColorPalette.coffeeSelected,
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'WPCafe coffee service is under maintanance! Please check back later.',
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSans3(
                color: ColorPalette.textColor,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
