import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/screens/request_coffee_screen.dart';

class RequestCoffee extends StatefulWidget {
  final Map<String, dynamic> cItem;
  const RequestCoffee({Key? key, required this.cItem}) : super(key: key);

  @override
  _RequestCoffeeState createState() => _RequestCoffeeState();
}

class _RequestCoffeeState extends State<RequestCoffee> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCoffeeScreen(cItem: widget.cItem)));
      },
      child: Container(
        height: 220.0,
        // width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              ColorPalette().gradientTopLeft,
              ColorPalette().gradientBottonRight,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 165.0,
              width: 150.0,
              child: Stack(
                children: [
                  Positioned(
                    top: 15.0,
                    left: 0.0,
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        image: DecorationImage(
                          image: NetworkImage(widget.cItem['thumbnail']!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    right: 0,
                    child: Container(
                      height: 25.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: const Color(0xFF342520).withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Iconify(
                              Iconoir.coffee_cup,
                              color: ColorPalette().coffeeSelected,
                              size: 15.0,
                            ),
                            Text(
                              widget.cItem['availableCoupon'].toString(),
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Center(
                child: Text(
                  widget.cItem['name']!,
                  style: GoogleFonts.sourceSans3(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Center(
                child: Text(
                  widget.cItem['ingredients'].map((item) {
                    return toBeginningOfSentenceCase(item.toString());
                  }).join(', '),
                  style: GoogleFonts.sourceSans3(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
