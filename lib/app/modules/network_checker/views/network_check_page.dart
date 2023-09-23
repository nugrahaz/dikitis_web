// import 'package:dikitis_web/app/utils/utils.dart';
// import 'package:dikitis_web/app/views/main_widgets/network_checker/network_controller.dart';
// import 'package:dikitis_web/app/views/theme_widgets/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
//
// class ConnectionStatusPage extends StatefulWidget {
//   final Widget child;
//
//   const ConnectionStatusPage({Key? key, required this.child}) : super(key: key);
//
//   @override
//   _ConnectionStatusPageState createState() => _ConnectionStatusPageState();
// }
//
// class _ConnectionStatusPageState extends State<ConnectionStatusPage> {
//   final NetworkController _networkController = Get.find<NetworkController>();
//
//   @override
//   void initState() {
//     super.initState();
//     BarManager.systemBarColor(
//         AppColor.bgDark.withOpacity(0.35), AppColor.bgDark.withOpacity(0.35));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Obx(
//         () => Stack(
//           children: [
//             widget.child,
//             _networkController.connectionStatus.value == 0
//                 ? Container(
//                     height: SizeConfig.screenHeight,
//                     width: SizeConfig.screenWidth,
//                     color: AppColor.bgDark.withOpacity(0.35),
//                     child: Center(
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: AppColor.white,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(16))),
//                         margin: EdgeInsets.all(SizeConfig.blockWidth * 15),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.all(SizeConfig.blockWidth * 1),
//                               padding:
//                                   EdgeInsets.all(SizeConfig.blockWidth * 1),
//                               decoration: BoxDecoration(
//                                   color: AppColor.bgDark,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(16))),
//                               child: Lottie.asset(
//                                   "assets/lottie/no_internet.json",
//                                   fit: BoxFit.contain),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(
//                                   top: SizeConfig.blockWidth * 6,
//                                   bottom: SizeConfig.blockWidth * 7,
//                                   right: SizeConfig.blockWidth * 6,
//                                   left: SizeConfig.blockWidth * 6),
//                               child: Text(
//                                 "Mohon mengecek koneksi internet Anda",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: AppColor.bgDark.withOpacity(0.8),
//                                     fontSize: SizeConfig.blockWidth * 4.2),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }
