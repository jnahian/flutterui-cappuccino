import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/utils/snackbar_util.dart';
import 'package:wp_cafe/extensions/string_extension.dart';
import 'package:wp_cafe/utils/string_util.dart';

class RequestedItem extends StatefulWidget {
  final Map<String, dynamic> item;
  const RequestedItem({Key? key, required this.item}) : super(key: key);

  @override
  RequestedItemState createState() => RequestedItemState();
}

class RequestedItemState extends State<RequestedItem> {
  @override
  Widget build(BuildContext context) {
    
    Color statusColor = widget.item['status'] == 'pending' ? ColorPalette.gray : ColorPalette.succees;

    return GestureDetector(
      onLongPress: () {
        SnackbarUtil(context).showSnackbar(message: 'Long pressed.');
      },
      child: Container(
        padding: const EdgeInsets.all(7.0),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        decoration: BoxDecoration(
          color: ColorPalette.coffeeSelected,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              // padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    ColorPalette.gradientTopLeft,
                    ColorPalette.gradientBottonRight,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    // margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(
                        // image: AssetImage('assets/images/beansbottom.jpg'),
                        image: NetworkImage(widget.item['menu']['thumbnail']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 145.0,
              height: 100.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 165,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.item['menu']['name'],
                                  style: GoogleFonts.sourceSans3(
                                    color: ColorPalette.textColor,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Badge(
                                  label: Text(StringUtil.capitalize(widget.item['status'])!),
                                  backgroundColor: statusColor,
                                  textStyle: GoogleFonts.sourceSans3(
                                    color: ColorPalette.textColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Serial Number: #${widget.item['serial_number'].toString()}',
                            style: GoogleFonts.sourceSans3(
                              color: ColorPalette.textColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (widget.item['note'] != null && widget.item['note'].isNotEmpty)
                            Text(
                              '" ${widget.item['note']}',
                              style: GoogleFonts.sourceSans3(
                                color: ColorPalette.textColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ) 
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.item['time_changed_format'],
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
