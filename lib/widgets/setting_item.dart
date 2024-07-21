import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/models/settings_menu_item.dart';
import 'package:wp_cafe/utils/snackbar_util.dart';

class SettingItem extends StatelessWidget {
  final SettingsMenuItem item;
  const SettingItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SnackbarUtil(context).showSnackbar(message: '${item.title} pressed.');
        item.onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(7.0),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10.0),
        //   color: ColorPalette.gradientTopLeft,
        // ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30.0,
              height: 30.0,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: ColorPalette.coffeeSelected,
              ),
              child: Iconify(item.icon!, color: ColorPalette.textColor),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 85.0,
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                item.title!,
                style: GoogleFonts.sourceSans3(
                  color: ColorPalette.textColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
