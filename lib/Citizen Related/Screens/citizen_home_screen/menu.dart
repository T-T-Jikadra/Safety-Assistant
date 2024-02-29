//for menu items in drawer
import 'package:fff/Components/rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "User Profile",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  Menu(
    title: "Serving NGO / Government Body",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  Menu(
    title: "Request History",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
  Menu(
    title: "Donation History",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  Menu(
    title: "Alerts",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  Menu(
    title: "Notices",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];

List<Menu> sidebarMenus2 = [
  Menu(
    title: "Digital Survival Guide",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu(
    title: "FAQ",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu(
    title: "About Us",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
  Menu(
    title: "Logout",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  // Menu(
  //   title: "---",
  //   rive: RiveModel(
  //       src: "assets/RiveAssets/icons.riv",
  //       artboard: "CHAT",
  //       stateMachineName: "CHAT_Interactivity"),
  // ),
];

//for navigation bar which is not gonna use
// List<Menu> bottomNavItems = [
//   Menu(
//     title: "Chat",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "CHAT",
//         stateMachineName: "CHAT_Interactivity"),
//   ),
//   Menu(
//     title: "Search",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "SEARCH",
//         stateMachineName: "SEARCH_Interactivity"),
//   ),
//   Menu(
//     title: "Timer",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "TIMER",
//         stateMachineName: "TIMER_Interactivity"),
//   ),
//   Menu(
//     title: "Notification",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "BELL",
//         stateMachineName: "BELL_Interactivity"),
//   ),
//   Menu(
//     title: "Profile",
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "USER",
//         stateMachineName: "USER_Interactivity"),
//   ),
// ];
