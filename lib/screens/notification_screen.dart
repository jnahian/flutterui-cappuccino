import 'dart:convert';

import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wp_cafe/bloc/notification_bloc.dart';
import 'package:wp_cafe/bloc/notification_event.dart';
import 'package:wp_cafe/bloc/notification_state.dart';
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
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBg,
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(title: 'Notifications'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 15),
                child: BlocProvider(
                  create: (context) => NotificationBloc()..add(FetchNotifications()),
                  child: BlocBuilder<NotificationBloc, NotificationState>(builder: (context, state) {
                    if (state is NotificationLoaded) {
                      return Column(
                        children: [
                          ...state.notifications.map((n) => NotificationItem(item: n)),
                          // NotificationItem(),
                          // NotificationItem(),
                          // NotificationItem(),
                          // NotificationItem(),
                          // NotificationItem(),
                          // NotificationItem(),
                          // NotificationItem(),
                          // NotificationItem(),
                          // NotificationItem(),
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
                  }),
                )
                // child: Column(
                //   children: [
                //     NotificationItem(),
                //     NotificationItem(),
                //     NotificationItem(),
                //     NotificationItem(),
                //     NotificationItem(),
                //     NotificationItem(),
                //     NotificationItem(),
                //     NotificationItem(),
                //     NotificationItem(),
                //   ],
                // ),
            ),
          )
        ],
      ),
    );
  }
}
