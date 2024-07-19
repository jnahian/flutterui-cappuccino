import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';

class StatusBadge extends StatefulWidget {
  final String label;
  final String type = 'info';

  const StatusBadge({Key? key, required this.label}) : super(key: key);

  @override
  _StatusBadgeState createState() => _StatusBadgeState();
}

class _StatusBadgeState extends State<StatusBadge> {
  final _bgColor = ColorPalette().gray;

  // if(this.type == '')

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text(widget.label),
      backgroundColor: _bgColor,
      textStyle: GoogleFonts.sourceSans3(
        color: ColorPalette().textColor,
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
