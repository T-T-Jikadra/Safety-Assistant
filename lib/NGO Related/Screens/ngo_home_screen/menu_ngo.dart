//for menu items in drawer
// ignore_for_file: camel_case_types
import 'package:fff/Components/rive_model.dart';

class Menu_ngo {
  final String title;
  final RiveModel rive;

  Menu_ngo({required this.title, required this.rive});
}

List<Menu_ngo> sidebarMenus = [
  Menu_ngo(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu_ngo(
    title: "NGO Profile",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  Menu_ngo(
    title: "Serving NGO / Government Body",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  Menu_ngo(
    title: "Response History",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
  Menu_ngo(
    title: "Donation History",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];

List<Menu_ngo> sidebarMenus2 = [
  Menu_ngo(
    title: "FAQ",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu_ngo(
    title: "About Us",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
  Menu_ngo(
    title: "Logout",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  // Menu_ngo(
  //   title: "---",
  //   rive: RiveModel(
  //       src: "assets/RiveAssets/icons.riv",
  //       artboard: "CHAT",
  //       stateMachineName: "CHAT_Interactivity"),
  // ),
];
