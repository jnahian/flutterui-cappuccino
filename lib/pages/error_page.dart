import 'package:flutter/material.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/widgets/bottom_navigation.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBg,
      bottomNavigationBar: const BottomNavigation(),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Error Route",
          style: TextStyle(color: ColorPalette.danger),
        ),
      ),
    );
  }
}
