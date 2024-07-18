import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/auth_state.dart';
import 'package:wp_cafe/bloc/menu_bloc.dart';
import 'package:wp_cafe/bloc/menu_event.dart';
import 'package:wp_cafe/bloc/menu_state.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:wp_cafe/models/statistic.dart';
import 'package:wp_cafe/screens/request_coffee_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  dynamic coffeeItems;

  final List<Statistic> statistics = [
    Statistic(count: "35", label: "Available Coffee", icon: IconPalette().coffeeBeans),
    Statistic(count: "380", label: "Consumed Coffee", icon: IconPalette().coffeeCup),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MenuBloc()..add(FetchMenus());
      },
      child: Scaffold(
        backgroundColor: ColorPalette().scaffoldBg,
        bottomNavigationBar: _buildBottomBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TopBar
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // todo
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F242C),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Iconify(Heroicons.bars_3_center_left_20_solid, size: 12.0, color: Color(0xFF4D4F52)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // todo
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      height: 36.0,
                      width: 150.0,
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        semanticsLabel: 'WPCafe Logo',
                        height: 42.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // todo
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is UserDataLoaded) {
                          return Container(
                            padding: const EdgeInsets.all(4.0),
                            height: 42.0,
                            width: 42.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: ColorPalette().coffeeUnselected,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(state.userData['avatar']!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          );
                        }

                        return Container(
                          padding: const EdgeInsets.all(7.0),
                          height: 42.0,
                          width: 42.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: ColorPalette().coffeeUnselected,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Welcome Section
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Good Afternoon',
                            style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.bold, color: ColorPalette().coffeeSelected, fontSize: 17.0),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Iconify(
                                Ci.dot_04_l,
                                color: Colors.green,
                              ),
                              Text('Barista is Online',
                                  style: GoogleFonts.sourceSans3(
                                      fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // User info
                    Container(
                      padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                      width: MediaQuery.of(context).size.width,
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Text(
                            state is UserDataLoaded ? state.userData['name'] : "",
                            style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32.0),
                          );
                        },
                      ),
                    ),
                    // User Limits
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...statistics.map((item) {
                            return _buildStatisticItem(item);
                          }).toList()
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Enjoy a coffee :)',
                        style:
                            GoogleFonts.sourceSans3(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    // const SizedBox(height: 10.0),
                    BlocBuilder<MenuBloc, MenuState>(
                      builder: (context, state) {
                        if (state is MenuLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorPalette().coffeeSelected,
                            ),
                          );
                        } else if (state is MenuLoaded) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              color: const Color(0xFF0D0F14),
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                              child: GridView.count(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                crossAxisCount: 2,
                                childAspectRatio: 0.72,
                                children: [
                                  ...state.menus.map((e) {
                                    return _buildCoffeeItem(e);
                                  }).toList()
                                ],
                              ),
                            ),
                          );
                        } else if (state is MenuError) {
                          return Center(child: Text('Error: ${state.message}'));
                        }
                        return const Center(child: Text('Press the button to fetch posts'));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeItem(cItem) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemDetails(cItem: cItem)));
      },
      child: Container(
        height: 220.0,
        // width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              ColorPalette().gradientTopLeft,
              ColorPalette().gradientBottonRight,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 165.0,
              width: 150.0,
              child: Stack(
                children: [
                  Positioned(
                    top: 15.0,
                    left: 0.0,
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        image: DecorationImage(
                          image: NetworkImage(cItem['thumbnail']!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    right: 0,
                    child: Container(
                      height: 25.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: const Color(0xFF342520).withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Iconify(
                              Iconoir.coffee_cup,
                              color: ColorPalette().coffeeSelected,
                              size: 15.0,
                            ),
                            Text(
                              cItem['availableCoupon'].toString(),
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Center(
                child: Text(
                  cItem['name']!,
                  style: GoogleFonts.sourceSans3(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Center(
                child: Text(
                  cItem['ingredients'].map((item) {
                    return toBeginningOfSentenceCase(item.toString());
                  }).join(', '),
                  style: GoogleFonts.sourceSans3(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem(Statistic sItem) {
    return Container(
        padding: const EdgeInsets.all(15),
        height: 100.0,
        width: (MediaQuery.of(context).size.width - 50) / 2,
        decoration: BoxDecoration(
          color: ColorPalette().statisticsBg,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 42.0,
                  width: 42.0,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorPalette().coffeeSelected,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Iconify(sItem.icon!, size: 12.0, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(sItem.count!,
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.bold, color: const Color(0xFFCECECE), fontSize: 32.0)),
                )
              ],
            ),
            Text(sItem.label!, style: GoogleFonts.sourceSans3(color: const Color(0xFFCECECE), fontSize: 16.0)),
          ],
        ));
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
      height: 80.0,
      decoration: const BoxDecoration(color: Color(0xFF1A1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Iconify(
              Heroicons.home,
              color: Color(0xFFD17742),
            ),
          ),
          const Iconify(
            Ph.handbag_fill,
            color: Color(0xFF4E4F53),
          ),
          const Iconify(
            Ri.heart_2_fill,
            color: Color(0xFF4E4F53),
          ),
          Container(
            child: Stack(
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
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
