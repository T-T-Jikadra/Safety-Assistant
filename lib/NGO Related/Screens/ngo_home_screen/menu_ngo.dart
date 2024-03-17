//for menu items in drawer
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Menu_ngo {
  final String title;
  final IconData icon;

  Menu_ngo({required this.title, required this.icon});
}

List<Menu_ngo> sidebarMenus = [
  Menu_ngo(
    title: "Home",
    icon: Icons.home,
  ),
  Menu_ngo(
    title: "NGO Profile",
    icon: Icons.person_2,
  ),
  Menu_ngo(
    title: "Other serving NGOs",
    icon: Icons.temple_hindu_rounded,
  ),
  Menu_ngo(
    title: "Response History",
    icon: Icons.history,
  ),
  Menu_ngo(
    title: "Donation History",
    icon: Icons.history_sharp,
  ),
  Menu_ngo(
    title: "Alerts",
    icon: Icons.crisis_alert,
  ),
  Menu_ngo(
    title: "Apply for Grant",
    icon: Icons.local_activity_outlined,
  ),
  Menu_ngo(
    title: "Notices",
    icon: Icons.circle_notifications,
  ),
];

List<Menu_ngo> sidebarMenus2 = [
  Menu_ngo(
    title: "FAQ",
    icon: Icons.question_answer_outlined,
  ),
  Menu_ngo(
    title: "About Us",
    icon: Icons.info_rounded,
  ),
  Menu_ngo(
    title: "Logout",
    icon: Iconsax.logout5,
  ),
];
