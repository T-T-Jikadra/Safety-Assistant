//for menu items in drawer
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Menu {
  final String title;
  final IconData icon;

  Menu({required this.title, required this.icon});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    icon: Icons.home,
  ),
  Menu(
    title: "User Profile",
    icon: CupertinoIcons.profile_circled,
  ),
  Menu(
    title: "Serving NGO / Government Body",
    icon: Icons.temple_hindu_rounded,
  ),
  Menu(
    title: "Request History",
    icon: Icons.history_outlined,
  ),
  Menu(
    title: "Donation History",
    icon: Icons.monetization_on_outlined,
  ),
  Menu(
    title: "Alerts",
    icon: Icons.crisis_alert,
  ),
  Menu(
    title: "Media",
    icon: Iconsax.stickynote4,
  ),
];

List<Menu> sidebarMenus2 = [
  Menu(
    title: "Digital Survival Guide",
    icon: Icons.cabin,
  ),
  Menu(
    title: "FAQ",
    icon: Icons.question_answer_outlined,
  ),
  Menu(
    title: "About Us",
    icon: Icons.info_rounded,
  ),
  Menu(
    title: "Logout",
    icon: Iconsax.logout5,
  ),
];
