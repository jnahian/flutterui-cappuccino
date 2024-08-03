import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:wp_cafe/utils/snackbar_util.dart';
import 'package:wp_cafe/utils/utils.dart';

class NotificationItem extends StatefulWidget {
  final Map<String, dynamic> item;
  const NotificationItem({Key? key, required this.item}) : super(key: key);

  @override
  NotificationItemState createState() => NotificationItemState();
}

class NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.item['new_message'] == null) {
      return SizedBox();
    }

    return GestureDetector(
      onLongPress: () {
        SnackbarUtil(context).showSnackbar(message: 'Long pressed.');
      },
      child: Container(
        padding: const EdgeInsets.all(7.0),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        decoration: BoxDecoration(
          color: ColorPalette.gradientTopLeft,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorPalette.gradientBottonRight,
              ),
              child: Stack(
                children: [
                  Iconify(IconPalette.notification, color: ColorPalette.textColor),
                  widget.item['read_at'] == null || widget.item['read_at'].isEmpty
                      ? Positioned(
                          top: 2.0,
                          left: 15.0,
                          child: Container(
                            height: 7.0,
                            width: 7.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.5),
                              color: ColorPalette.danger,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 85.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item['new_message'],
                    // "Your request for Cappuccino is pending by Julkar Naen Nahian",
                    style: GoogleFonts.sourceSans3(
                      color: ColorPalette.textColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Utils.formatDate(widget.item['created_at'])!,
                        style: GoogleFonts.sourceSans3(
                          color: ColorPalette.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
