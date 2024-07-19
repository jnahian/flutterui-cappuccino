import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/utils/snackbar_util.dart';

class RequestedItem extends StatelessWidget {
  const RequestedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        SnackbarUtil(context).showSnackbar(message: 'Long pressed.');
      },
      child: Container(
        padding: const EdgeInsets.all(7.0),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        decoration: BoxDecoration(
          color: ColorPalette.coffeeSelected,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              // padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    ColorPalette.gradientTopLeft,
                    ColorPalette.gradientBottonRight,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    // margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/beansbottom.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // Text(
                  //   'Mocha',
                  //   style: GoogleFonts.sourceSans3(
                  //     color: ColorPalette.textColor,
                  //     fontSize: 14.0,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 145.0,
              height: 100.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 165,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cappuccino",
                                  style: GoogleFonts.sourceSans3(
                                    color: ColorPalette.textColor,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Badge(
                                  label: const Text('Pending'),
                                  backgroundColor: ColorPalette.gray,
                                  textStyle: GoogleFonts.sourceSans3(
                                    color: ColorPalette.textColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Serial Number: #4',
                            style: GoogleFonts.sourceSans3(
                              color: ColorPalette.textColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   '" 3 spoon sugar',
                          //   style: GoogleFonts.sourceSans3(
                          //     color: ColorPalette.textColor,
                          //     fontSize: 14.0,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '25 Sec Ago | 05:30 PM',
                        style: GoogleFonts.sourceSans3(
                          color: ColorPalette.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
