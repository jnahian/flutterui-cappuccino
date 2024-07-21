import 'package:flutter/material.dart' hide BackButton;
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/widgets/bottom_navigation.dart';
import 'package:wp_cafe/widgets/notification_item.dart';
import 'package:wp_cafe/widgets/top_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPalette.scaffoldBg,
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(title: 'Notifications'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                  NotificationItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
