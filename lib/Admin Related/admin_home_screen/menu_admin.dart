//for menu items in drawer
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Menu_admin {
  final String title;
  final IconData icon;

  Menu_admin({required this.title, required this.icon});
}

List<Menu_admin> sidebarMenus = [
  Menu_admin(
    title: "Home",
    icon: Icons.home,
  ),
  Menu_admin(
    title: "Manage Citizen",
    icon: Icons.temple_hindu_rounded,
  ),
  Menu_admin(
    title: "Manage Govt Agencies",
    icon: Icons.garage_outlined,
  ),
  Menu_admin(
    title: "Manage NGO",
    icon: Icons.money_rounded,
  ),
  Menu_admin(
    title: "Request History",
    icon: Icons.history,
  ),
  Menu_admin(
    title: "Manage Alerts",
    icon: Icons.crisis_alert,
  ),
  Menu_admin(
    title: "Manage Media",
    icon: Icons.circle_notifications,
  ),
  Menu_admin(
    title: "Donation History",
    icon: Icons.money_rounded,
  ),
];

List<Menu_admin> sidebarMenus2 = [
  Menu_admin(
    title: "FAQ",
    icon: Icons.question_answer_outlined,
  ),
  Menu_admin(
    title: "About Us",
    icon: Icons.info_rounded,
  ),
  Menu_admin(
    title: "Logout",
    icon: Iconsax.logout5,
  ),
];
