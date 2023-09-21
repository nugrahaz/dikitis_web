part of 'utils.dart';

class SharedMethod {
  //Coloring System Bar
  static void systemBarColor(Color statusColor, Color navColor) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusColor, //top bar color
      statusBarIconBrightness: (statusColor != AppStyles.colors.white)
          ? Brightness.light
          : Brightness.dark, //top bar icons
      systemNavigationBarColor: navColor, //bottom bar color
      systemNavigationBarIconBrightness: (navColor != AppStyles.colors.white)
          ? Brightness.light
          : Brightness.dark, //bottom bar icons
    ));
  }

  //Check Connection
  static void checkConnectionBeforeExecute(Function() functions) async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      Get.dialog(
          NoConnectionDialog(
            colorNavigationBar: AppStyles.colors.bgDark,
          ),
          barrierDismissible: true);
    } else {
      functions();
    }
  }

  static void customDialog({
    String? title,
    String? imagePath,
    String? description,
    String? buttonText,
    Function()? function,
    Color? colorStatusBar,
    Color? colorNavigationBar,
  }) {
    Get.dialog(
        CustomDialog(
          title: title ?? "Keluar",
          imagePath: imagePath ?? AssetsPath.lottie.exit,
          description:
              description ?? "Apakah Anda ingin meninggalkan aplikasi ini?",
          buttonText: buttonText ?? "Ya, tentu",
          function: function ??
              () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
          colorStatusBar: colorStatusBar,
          colorNavigationBar: colorNavigationBar,
        ),
        barrierColor: AppStyles.colors.bgDark.withOpacity(0.33));
  }

  static void showSnackbar(
      {required String title, required String description}) {
    Get.snackbar(
      "",
      "",
      titleText: Padding(
        padding: EdgeInsets.only(left: 3 * SizeConfig.blockWidth),
        child: Text(
          title,
          style: AppStyles.textStyles.poppinsBold.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize:
                  1.25 * SizeConfig.blockWidth + SizeConfig.blockHeight * 0.3),
        ),
      ),
      messageText: Padding(
        padding: EdgeInsets.only(
          left: 3 * SizeConfig.blockWidth,
        ),
        child: Text(
          description,
          style: AppStyles.textStyles.poppinsSemiBold.copyWith(
              fontSize:
                  1.25 * SizeConfig.blockWidth + SizeConfig.blockHeight * 0.3,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
              letterSpacing: 0.25),
        ),
      ),
      shouldIconPulse: false,
      icon: Container(
        padding: EdgeInsets.only(left: 2 * SizeConfig.blockWidth),
        child: Icon(
          Icons.info_outline_rounded,
          color: Colors.white,
          size: 2.1 * SizeConfig.blockWidth + SizeConfig.blockHeight * 2.1,
        ),
      ),
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 3000),
      animationDuration: const Duration(milliseconds: 750),
      margin: EdgeInsets.symmetric(
          vertical: 2 * SizeConfig.blockWidth + SizeConfig.blockHeight * 2.0,
          horizontal:
              20.5 * SizeConfig.blockWidth + SizeConfig.blockHeight * 6.0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueGrey,
      colorText: Colors.white,
    );
  }

  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
