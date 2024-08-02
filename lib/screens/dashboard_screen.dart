import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/auth_event.dart';
import 'package:wp_cafe/bloc/auth_state.dart';
import 'package:wp_cafe/bloc/menu_bloc.dart';
import 'package:wp_cafe/bloc/menu_event.dart';
import 'package:wp_cafe/bloc/menu_state.dart';
import 'package:wp_cafe/bloc/order_bloc.dart';
import 'package:wp_cafe/bloc/order_event.dart';
import 'package:wp_cafe/bloc/order_state.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:wp_cafe/models/statistic.dart';
import 'package:wp_cafe/widgets/barista_status.dart';
import 'package:wp_cafe/widgets/bottom_navigation.dart';
import 'package:wp_cafe/widgets/menu_item.dart';
import 'package:wp_cafe/widgets/maintainance.dart';
import 'package:wp_cafe/widgets/requested_item.dart';
import 'package:wp_cafe/widgets/say_greeting.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBg,
      bottomNavigationBar: const BottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TopBar
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/header_bg.jpg'),
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     // todo
                    //   },
                    //   child: Container(
                    //     padding: const EdgeInsets.all(7.0),
                    //     height: 35.0,
                    //     width: 35.0,
                    //     decoration: BoxDecoration(
                    //       color: ColorPalette.gradientTopLeft,
                    //       borderRadius: BorderRadius.circular(12.0),
                    //     ),
                    //     child: const Iconify(Heroicons.bars_3_center_left_20_solid, size: 12.0, color: Color(0xFF4D4F52)),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 35.0,
                    // ),
                    GestureDetector(
                      onTap: () {
                        // todo
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        // height: 36.0,
                        width: 150.0,
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          semanticsLabel: 'WPCafe Logo',
                          height: 35.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // todo
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Container(
                            padding: const EdgeInsets.all(4.0),
                            height: 35.0,
                            width: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: ColorPalette.gradientTopLeft,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: state is UserDataLoaded
                                    ? DecorationImage(
                                        image: NetworkImage(state.userData['avatar']!),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        image: AssetImage('assets/images/user.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // Welcome Section
                Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SayGreeting(),
                      BaristaStatus(),
                    ],
                  ),
                ),
                // User info
                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(
                        state is UserDataLoaded ? state.userData['name'] : "",
                        style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.bold, color: ColorPalette.textColor, fontSize: 32.0),
                      );
                    },
                  ),
                ),
                // User coupons
                BlocProvider(
                  create: (context) => AuthBloc()..add(const FetchUserCoupon()),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final List<Statistic> statistics = [
                        Statistic(
                          count: (state is UserCouponLoaded ? state.userCoupon['available'] : 0).toString(),
                          label: "Available Coffee",
                          icon: IconPalette.coffeeBeans,
                        ),
                        Statistic(
                          count: (state is UserCouponLoaded ? state.userCoupon['consumed'] : 0).toString(),
                          label: "Consumed Coffee",
                          icon: IconPalette.coffeeCup,
                        ),
                      ];
                      return Container(
                        padding: const EdgeInsets.only(top: 15.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...statistics.map((item) {
                              return _buildStatisticItem(item);
                            }).toList()
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Enjoy a coffee :)',
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.bold, color: ColorPalette.textColor, fontSize: 18.0),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => OrderBloc()..add(FetchPendingOrders()),
                    child: BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                        if (state is PendingOrderLoaded && state.pendingOrders.isNotEmpty) {
                          return Column(
                            children: [
                              ...state.pendingOrders.map((po) => RequestedItem(item: po)),
                            ],
                          );
                          // return RequestedItem();
                        }
                        return SizedBox();
                      },
                    ),
                  ),
                  BlocProvider(
                    create: (context) => MenuBloc()..add(FetchMenus()),
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is MaintananceStatusLoaded && state.maintainance) {
                          return Maintainance();
                        }
                        return SizedBox();
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  BlocProvider(
                    create: (context) => MenuBloc()..add(FetchMenus()),
                    child: BlocBuilder<MenuBloc, MenuState>(
                      builder: (context, state) {
                        if (state is MenuLoading) {
                          return Container(
                            height: 300,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              color: ColorPalette.coffeeSelected,
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
                                    return MenuItem(cItem: e);
                                  }).toList()
                                ],
                              ),
                            ),
                          );
                        } else if (state is MenuError) {
                          return Center(
                              child: Text(
                            'Error: ${state.message}',
                            style: const TextStyle(color: Colors.red),
                          ));
                        }
                        return const Center(child: Text('Press the button to fetch posts'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // BottomSheet(
          //   onClosing: () {},
          //   builder: (context) {
          //     return Container(
          //       padding: EdgeInsets.all(15.0),
          //       child: Text("hello world!"),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildStatisticItem(Statistic sItem) {
    return GlassContainer(
      height: 100.0,
      blur: 4,
      border: const Border.fromBorderSide(BorderSide.none),
      borderRadius: BorderRadius.circular(12.0),
      color: ColorPalette.coffeeUnselected.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 100.0,
        width: (MediaQuery.of(context).size.width - 50) / 2,
        decoration: BoxDecoration(
          color: ColorPalette.statisticsBg,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 35.0,
                  width: 35.0,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorPalette.coffeeSelected,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Iconify(sItem.icon!, size: 12.0, color: ColorPalette.textColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(sItem.count!,
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.bold, color: const Color(0xFFCECECE), fontSize: 32.0)),
                )
              ],
            ),
            Text(
              sItem.label!,
              style: GoogleFonts.sourceSans3(color: const Color(0xFFCECECE), fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
