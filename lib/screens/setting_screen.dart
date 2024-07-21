import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/enums/icon_palette.dart';
import 'package:wp_cafe/models/settings_menu_item.dart';
import 'package:wp_cafe/screens/login_screen.dart';
import 'package:wp_cafe/widgets/bottom_navigation.dart';
import 'package:wp_cafe/widgets/buttons/back_button.dart';
import 'package:wp_cafe/widgets/setting_item.dart';
import 'package:wp_cafe/widgets/top_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final List<SettingsMenuItem> menuItems = [
      SettingsMenuItem(
        title: "Edit Profile",
        icon: IconPalette.profile,
      ),
      SettingsMenuItem(
        title: "Change Password",
        icon: IconPalette.password,
      ),
      SettingsMenuItem(
        title: "Order History",
        icon: IconPalette.history,
      ),
      SettingsMenuItem(
        title: "Coffee Conversion",
        icon: IconPalette.conversion,
      ),
      SettingsMenuItem(
        title: "Request Coffee",
        icon: IconPalette.request,
      ),
      SettingsMenuItem(
        title: "Logout",
        icon: IconPalette.logout,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBg,
      bottomNavigationBar: const BottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBar(title: 'Settings'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  ...menuItems.map((item) => SettingItem(
                        item: item,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
