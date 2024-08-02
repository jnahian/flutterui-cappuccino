import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:wp_cafe/bloc/menu_bloc.dart';
import 'package:wp_cafe/bloc/menu_event.dart';
import 'package:wp_cafe/bloc/menu_state.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wp_cafe/widgets/bottom_navigation.dart';
import 'package:wp_cafe/widgets/buttons/back_button.dart';
import 'package:wp_cafe/widgets/form/request_coffee.dart';

class RequestCoffeeScreen extends StatefulWidget {
  final String itemId;
  const RequestCoffeeScreen({super.key, required this.itemId});

  @override
  State<RequestCoffeeScreen> createState() => _RequestCoffeeScreenState();
}

class _RequestCoffeeScreenState extends State<RequestCoffeeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final String itemId = widget.itemId;
    print("Item ID: $itemId");

    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBg,
      bottomNavigationBar: const BottomNavigation(),
      body: BlocProvider(
        create: (context) => MenuBloc()..add(FetchMenuData(itemId)),
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is MenuDetailsLoaded) {
              return Stack(
                children: [
                  SizedBox(
                    height: screenHeight,
                    width: screenWidth,
                  ),
                  Hero(
                    tag: state.menu['thumbnail'],
                    child: Container(
                      height: (screenHeight / 2) - 20.0,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(state.menu['thumbnail']), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 15.0,
                    child: Container(
                      color: Colors.transparent,
                      height: 50.0,
                      width: screenWidth - 20.0,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButton(),
                          // GestureDetector(
                          //   onTap: () {
                          //     // Navigator.of(context).pop();
                          //   },
                          //   child: Container(
                          //     height: 45.0,
                          //     width: 45.0,
                          //     decoration: BoxDecoration(
                          //         color: const Color(0xFF14181D),
                          //         border: Border.all(color: const Color(0xFF322B2E), width: 1.0),
                          //         borderRadius: BorderRadius.circular(15.0)),
                          //     child: const Icon(
                          //       Icons.favorite_rounded,
                          //       color: Color(0xFF525154),
                          //       size: 17.0,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: (screenHeight / 2) - 100.0,
                    child: GlassContainer(
                      height: 130.0,
                      width: screenWidth,
                      blur: 4,
                      border: const Border.fromBorderSide(BorderSide.none),
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.black.withOpacity(0.6),
                      child: SizedBox(
                        height: 120.0,
                        width: screenWidth - 20.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 25.0),
                              height: 120.0,
                              width: (screenWidth) / 1.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.menu['name']!,
                                    style: GoogleFonts.sourceSans3(
                                      color: ColorPalette.textColor,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.menu['ingredients_with_bar']!,
                                    style: GoogleFonts.sourceSans3(
                                      color: const Color(0xFFADADAD),
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      const Iconify(
                                        GameIcons.coffee_cup,
                                        color: ColorPalette.coffeeSelected,
                                        size: 22.0,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        state.menu['availableCoupon'].toString(),
                                        style: GoogleFonts.sourceSans3(
                                          color: ColorPalette.textColor,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // const SizedBox(width: 10.0),
                                      // Text(
                                      //   '(6,986)',
                                      //   style: GoogleFonts.sourceSans3(
                                      //     color: const Color(0xFFADADAD),
                                      //     fontSize: 15.0,
                                      //   ),
                                      // )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 25.0),
                              height: 120.0,
                              width: (screenWidth - 20.0) / 2.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0), color: const Color(0xFF0F1419)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Iconify(
                                              IconPalette.coffeeCup2,
                                              color: ColorPalette.coffeeSelected,
                                              size: 21.0,
                                            ),
                                            const SizedBox(height: 2.0),
                                            Text(
                                              'Coffee',
                                              style: GoogleFonts.sourceSans3(
                                                color: const Color(0xFF909193),
                                                fontSize: 12.0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0), color: const Color(0xFF0F1419)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Iconify(
                                              IconPalette.milk,
                                              color: ColorPalette.coffeeSelected,
                                              size: 21.0,
                                            ),
                                            const SizedBox(height: 2.0),
                                            Text(
                                              'Milk',
                                              style: GoogleFonts.sourceSans3(
                                                color: const Color(0xFF909193),
                                                fontSize: 12.0,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 35.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0), color: const Color(0xFF0F1419)),
                                        child: Center(
                                          child: Text('Medium Roasted',
                                              style: GoogleFonts.sourceSans3(
                                                color: const Color(0xFF909193),
                                                fontSize: 12.0,
                                              )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight / 2 + 30.0,
                    child: SizedBox(
                      height: screenHeight / 2,
                      width: screenWidth,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: GoogleFonts.sourceSans3(color: const Color(0xFF999A9B), fontSize: 17.0),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 50.0,
                                width: screenWidth - 30.0,
                                child: Text(
                                  state.menu['description'],
                                  style: GoogleFonts.sourceSans3(color: ColorPalette.textColor, fontSize: 17.0),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              RequestCoffee(cItem: state.menu)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return Container(
              height: 300,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: ColorPalette.coffeeSelected,
              ),
            );
          },
        ),
      ),
    );
  }
}
