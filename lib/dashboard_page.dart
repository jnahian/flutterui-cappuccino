import 'package:cappuccino/color_palette.dart';
import 'package:cappuccino/models/statistic.dart';
import 'package:cappuccino/screens/item_details.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/game_icons.dart';

import 'models/coffee_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> coffeeTypes = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White'
  ];

  final List<Statistic> statisics = [
    Statistic(
        count: "35", label: "Available Coffee", icon: GameIcons.coffee_beans),
    Statistic(count: "380", label: "Consumed Coffee", icon: Iconoir.coffee_cup),
  ];

  String selectedItem = 'Cappuccino';
  int counter = -1;

  final List<CoffeeItem> coffeeList = [
    CoffeeItem(
        rating: 4.5,
        itemImg: 'assets/images/coffeemain.jpg',
        price: 4.21,
        subtitle: 'With Oat Milk',
        title: 'Cappuccino'),
    CoffeeItem(
        rating: 4.2,
        itemImg: 'assets/images/secondary.jpg',
        price: 3.14,
        subtitle: 'With Chocolate',
        title: 'Latte'),
    CoffeeItem(
        rating: 4.1,
        itemImg: 'assets/images/beansbottom.jpg',
        price: 5.2,
        subtitle: 'With Chocolate',
        title: 'Mocha'),
    CoffeeItem(
        rating: 4.7,
        itemImg: 'assets/images/beansbottom.jpg',
        price: 5.2,
        subtitle: 'With Milk Chocolate',
        title: 'Flavoured Latte'),
    CoffeeItem(
        rating: 4.5,
        itemImg: 'assets/images/coffeemain.jpg',
        price: 4.21,
        subtitle: 'With Oat Milk',
        title: 'Espresso'),
    CoffeeItem(
        rating: 4.2,
        itemImg: 'assets/images/secondary.jpg',
        price: 3.14,
        subtitle: 'With Chocolate',
        title: 'Americano')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: _buildBottomBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F242C),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Iconify(
                            Heroicons.bars_3_center_left_20_solid,
                            size: 12.0,
                            color: Color(0xFF4D4F52)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/user.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Good Afternoon',
                          style: GoogleFonts.sourceSans3(
                              fontWeight: FontWeight.bold,
                              color: ColorPalette().coffeeSelected,
                              fontSize: 17.0)),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Iconify(
                            Ci.dot_04_l,
                            color: Colors.green,
                          ),
                          Text('Barista is Online',
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14.0)),
                        ],
                      )
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text('Julkar Naen Nahian',
                      style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32.0))),
              Container(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...statisics.map((item) {
                      return _buildStatisticItem(item);
                    }).toList()
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: const Color(0xFF0D0F14),
                  height: MediaQuery.of(context).size.height - 10.0,
                  width: MediaQuery.of(context).size.width - 30.0,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: GridView.count(
                    // physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    children: [
                      ...coffeeList.map((e) {
                        return _buildCoffeeItem(e);
                      }).toList()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeItem(CoffeeItem cItem) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetails(cItem: cItem)));
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
                ])),
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
                          image: DecorationImage(
                            image: AssetImage(cItem.itemImg!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
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
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
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
                              cItem.rating.toString(),
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13.0),
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
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Center(
                child: Text(
                  cItem.title!,
                  style: GoogleFonts.sourceSans3(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
              child: Center(
                child: Text(
                  cItem.subtitle!,
                  style: GoogleFonts.sourceSans3(
                      color: Colors.white, fontSize: 14.0),
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
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFCECECE),
                          fontSize: 32.0)),
                )
              ],
            ),
            Text(sItem.label!,
                style: GoogleFonts.sourceSans3(
                    color: const Color(0xFFCECECE), fontSize: 16.0)),
          ],
        )
    );
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.5),
                          color: Colors.red),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
