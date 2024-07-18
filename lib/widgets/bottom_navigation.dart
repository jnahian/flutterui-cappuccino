import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:wp_cafe/screens/login_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
      height: 60.0,
      decoration: const BoxDecoration(color: Color(0xFF1A1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Iconify(IconPalette().home, color: Color(0xFFD17742)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: const Iconify(Ic.round_login, color: Color(0xFF4E4F53)),
          ),
          const Iconify(Ri.heart_2_fill, color: Color(0xFF4E4F53)),
          Stack(
            children: [
              const Iconify(
                Heroicons.bell,
                color: Color(0xFF4E4F53),
              ),
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
