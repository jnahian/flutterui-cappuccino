import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:wp_cafe/screens/dashboard_screen.dart';
import 'package:wp_cafe/screens/notification_screen.dart';
import 'package:wp_cafe/screens/setting_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: ColorPalette.coffeeSelected, width: 3.0)),
              ),
              child: const Iconify(IconPalette.bars, color: ColorPalette.coffeeSelected),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
          //   },
          //   child: const Iconify(IconPalette.login, color: ColorPalette.textColor),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashboardScreen()));
            },
            child: const Iconify(IconPalette.home, color: ColorPalette.textColor),
          ),
          // const Iconify(Ri.heart_2_fill, color: Color(0xFF4E4F53)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Stack(
              children: [
                const Iconify(IconPalette.notification, color: ColorPalette.textColor),
                Positioned(
                  top: 2.0,
                  left: 15.0,
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.5), color: Colors.red),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
