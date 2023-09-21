part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final Function()? function;
  final String? title;
  final Color? color, disabledColor, splashColor, titleColor, borderColor;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final double? width;
  final bool? withBorder;
  final bool? onlyIcon;
  final IconData? icons;

  const CustomButton({
    Key? key,
    @required this.function, //sudah
    this.title = "", //sudah
    @required this.color, //sudah
    this.disabledColor, //sudah
    this.splashColor, //sudah
    this.titleColor, //sudah
    this.borderColor, //sudah
    this.height,
    this.fontSize,
    this.borderRadius = 12,
    this.width,
    this.withBorder = false,
    this.icons,
    @required this.onlyIcon, //sudah
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBounceWidget(
      onPressed: function!,
      duration: const Duration(milliseconds: 100),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical:
                SizeConfig.blockWidth * 0.4 + SizeConfig.blockHeight * 0.4),
        height: (height == null)
            ? SizeConfig.blockHeight * 3.9 + SizeConfig.blockWidth * 3.9
            : height,
        width: (width != null) ? width : null,
        decoration: BoxDecoration(
          border: Border.all(
              color: (borderColor) != null ? borderColor! : color!, width: 2),
          borderRadius: BorderRadius.circular(
              (borderRadius != null) ? borderRadius! : 12),
          color: color ?? AppStyles.colors.cyan,
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              (borderRadius != null) ? borderRadius! : 12,
            ),
            color: color ?? Colors.cyan,
          ),
          child: (onlyIcon != true)
              ? Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 5.0),
                  child: Center(
                    child: AutoSizeText(
                      title!,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                        color: titleColor,
                        fontSize: SizeConfig.blockWidth * 1.4 +
                            SizeConfig.blockHeight * 0.4,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                )
              : Center(child: Icon(icons)),
        ),
      ),
    );
  }
}
