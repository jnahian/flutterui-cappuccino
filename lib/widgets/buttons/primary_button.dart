import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final double width;
  final String buttonText;

  const PrimaryButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.width,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette().coffeeSelected,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        fixedSize: Size(width - 30, 50),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              buttonText,
              style: GoogleFonts.sourceSans3(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
    );
  }
}
