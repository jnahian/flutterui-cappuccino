import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {

    final ModalRoute? modalRoute = ModalRoute.of(context);
    final String? currentRouteName = modalRoute?.settings.name;

    // Do something with the currentRouteName
    print("Current route: $currentRouteName");

    return Container(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 15.0),
      height: 60.0,
      decoration: const BoxDecoration(color: Color(0xFF1A1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              currentRouteName != '/settings' ? Navigator.pushNamed(context, '/settings') : null;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: currentRouteName == '/settings'
                  ? const BoxDecoration(
                border: Border(top: BorderSide(color: ColorPalette.coffeeSelected, width: 3.0)),
                    )
                  : null,
              child: Iconify(
                IconPalette.bars,
                color: currentRouteName == '/settings' ? ColorPalette.coffeeSelected : ColorPalette.textColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              currentRouteName != '/' ? Navigator.pushNamed(context, '/') : null;
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashboardScreen()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: currentRouteName == '/'
                  ? const BoxDecoration(
                      border: Border(top: BorderSide(color: ColorPalette.coffeeSelected, width: 3.0)),
                    )
                  : null,
              child: Iconify(
                IconPalette.home,
                color: currentRouteName == '/' ? ColorPalette.coffeeSelected : ColorPalette.textColor,
              ),
            ),            
          ),
          // const Iconify(Ri.heart_2_fill, color: Color(0xFF4E4F53)),
          GestureDetector(
            onTap: () {
              currentRouteName != '/notifications' ? Navigator.pushNamed(context, '/notifications') : null;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: currentRouteName == '/notifications'
                  ? const BoxDecoration(
                      border: Border(top: BorderSide(color: ColorPalette.coffeeSelected, width: 3.0)),
                    )
                  : null,
              child: Stack(
                children: [
                  Iconify(
                    IconPalette.notification,
                    color: currentRouteName == '/notifications' ? ColorPalette.coffeeSelected : ColorPalette.textColor,
                  ),
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
            ),            
          )
        ],
      ),
    );
  }
}
