part of 'widgets.dart';

class CustomDialog extends StatefulWidget {
  final String? title, description, buttonText;
  final String? imagePath;
  final Function()? function;
  final Color? colorStatusBar;
  final Color? colorNavigationBar;

  const CustomDialog({
    Key? key,
    this.title = "",
    this.description = "",
    this.buttonText = "",
    this.imagePath = "",
    this.function,
    this.colorStatusBar = Colors.transparent,
    this.colorNavigationBar = Colors.transparent,
  }) : super(key: key);

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
  // double padding = SizeConfig.blockWidth * 5.0;
  // double avatarRadius = SizeConfig.blockWidth * 15.0;
  double padding = 30;
  double avatarRadius = 90;

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        widget.colorStatusBar!, widget.colorNavigationBar!);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            width: SizeConfig.screenWidth * 1.7 / 5,
            padding: EdgeInsets.only(
                top: avatarRadius - 20,
                left: padding,
                right: padding,
                bottom: padding - 10),
            margin: EdgeInsets.only(top: avatarRadius - 10, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(padding * 0.8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  widget.title!,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                    fontSize: SizeConfig.blockWidth * 2.4,
                    fontWeight: FontWeight.w900,
                    color: AppStyles.colors.bgDark.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: SizeConfig.blockWidth / 2),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 2),
                  child: Text(
                    widget.description!,
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                        color: AppStyles.colors.bgDark.withOpacity(0.8),
                        fontSize: SizeConfig.blockWidth * 1.4,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        wordSpacing: 1),
                  ),
                ),
                SizedBox(height: SizeConfig.blockWidth * 1.0),
                //ya
                CustomButton(
                    onlyIcon: false,
                    width: SizeConfig.blockWidth * 50.0,
                    borderRadius: 16,
                    height: SizeConfig.blockWidth * 5,
                    color: AppStyles.colors.bgDark,
                    borderColor: AppStyles.colors.bgDark,
                    title: widget.buttonText,
                    titleColor: Colors.white,
                    function: () {
                      Navigator.pop(context, true);
                      widget.function!();
                    }),
                //tidak
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: SizeConfig.blockHeight * 6.25,
                    child: Center(
                      child: Text(
                        //No, thanks
                        "Tidak, terima kasih",
                        style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockWidth * 1.4,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Gambar
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipOval(
                child: Container(
                  color: Colors.white,
                  height: SizeConfig.blockWidth * 12.5,
                  width: SizeConfig.blockWidth * 12.5,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.blockWidth * 1.5),
                    child: Lottie.asset(
                      widget.imagePath!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
