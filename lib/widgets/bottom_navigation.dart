import 'package:flutter/material.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:wp_cafe/screens/login_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 15.0),
      height: 60.0,
      decoration: const BoxDecoration(color: Color(0xFF1A1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.home_outlined, color: ColorPalette().textColor),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Icon(Icons.login_outlined, color: ColorPalette().textColor),
          ),
          // const Iconify(Ri.heart_2_fill, color: Color(0xFF4E4F53)),
          Stack(
            children: [
              Icon(Icons.notifications_outlined, color: ColorPalette().textColor),
              Positioned(
                top: 2.0,
                left: 15.0,
                child: Container(
                  height: 7.0,
                  width: 7.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.5), color: Colors.red),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
