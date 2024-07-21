import 'package:flutter/material.dart';

class SettingsMenuItem {
  String? title;
  String? icon;
  VoidCallback? onTap;
  // String? count;

  SettingsMenuItem({this.title, this.icon, this.onTap});

  SettingsMenuItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    onTap = json['onTap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['icon'] = icon;
    data['onTap'] = onTap;
    return data;
  }
}
