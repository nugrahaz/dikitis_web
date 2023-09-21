part of 'widgets.dart';

class NoConnectionDialog extends StatefulWidget {
  final Color? colorStatusBar;
  final Color? colorNavigationBar;

  const NoConnectionDialog({
    Key? key,
    this.colorStatusBar = Colors.transparent,
    this.colorNavigationBar = Colors.transparent,
  }) : super(key: key);

  @override
  State<NoConnectionDialog> createState() => _NoConnectionDialogState();
}

class _NoConnectionDialogState extends State<NoConnectionDialog> {
  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        widget.colorStatusBar!, widget.colorNavigationBar!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: AppStyles.colors.bgDark.withOpacity(0.2),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: AppStyles.colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              margin: EdgeInsets.symmetric(
                  horizontal: 12.5 * SizeConfig.blockWidth),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(1 * SizeConfig.blockWidth),
                      padding: EdgeInsets.all(1 * SizeConfig.blockWidth),
                      decoration: BoxDecoration(
                          color: AppStyles.colors.bgDark,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: Lottie.asset(AssetsPath.lottie.noInternet,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 6 * SizeConfig.blockWidth,
                        bottom: 7 * SizeConfig.blockWidth,
                        right: 6 * SizeConfig.blockWidth,
                        left: 6 * SizeConfig.blockWidth),
                    child: Text(
                      "Mohon cek kembali koneksi internet Anda",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppStyles.colors.bgDark.withOpacity(0.8),
                          fontSize: 4.2 * SizeConfig.blockWidth,
                          letterSpacing: 0.8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
