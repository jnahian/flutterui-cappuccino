import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
          color: const Color(0xFF14181D),
          border: Border.all(
            color: const Color(0xFF322B2E),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
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
