import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/widgets/buttons/back_button.dart';

class TopBar extends StatefulWidget {
  final String title;
  const TopBar({Key? key, required this.title}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 55.0, 15.0, 5.0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackButton(),
          Text(
            widget.title,
            style: GoogleFonts.sourceSans3(
              fontSize: 17.0,
              color: ColorPalette.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 40)
        ],
      ),
    );
  }
}
