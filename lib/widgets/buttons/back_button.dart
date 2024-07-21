import 'package:flutter/material.dart';
import 'package:wp_cafe/enums/color_palette.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          color: ColorPalette.gradientTopLeft,
          border: Border.all(
            color: ColorPalette.gradientTopLeft,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF525154),
          size: 17.0,
        ),
      ),
    );
  }
}
