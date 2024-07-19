import 'package:wp_cafe/enums/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width - 30.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorPalette.searchBarFill),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: 'Find your coffee ...',
              contentPadding: const EdgeInsets.fromLTRB(10.0, 2.0, 5.0, 12.0),
              hintStyle:
                  GoogleFonts.sourceSans3(color: const Color(0xFF525559)),
              border: InputBorder.none,
              fillColor: ColorPalette.searchBarFill,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 8.0, left: 8.0),
                child: Iconify(
                  Ri.search_2_fill,
                  color: Color(0xFF525559),
                ),
              ),
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 20.0, maxWidth: 40.0),
              prefixIconColor: const Color(0xFF525559)),
          style: GoogleFonts.sourceSans3(color: const Color(0xFF525559)),
        ),
      ),
    );
  }
}
