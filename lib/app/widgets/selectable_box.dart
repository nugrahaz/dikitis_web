part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool? isSelected;
  final bool? isEnabled;
  final double? width;
  final IconData? icon;
  final String? text;
  final Function? onTap;
  final TextStyle? textStyle;

  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnabled = true,
      @required this.width,
      this.onTap,
      this.textStyle,
      @required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (!isEnabled!)
                  ? Color(0xFFE4E4E4)
                  : isSelected!
                      ? Colors.blueGrey
                      : Colors.transparent,
              border: Border.all(
                  color: (!isEnabled!)
                      ? Color(0xFFE4E4E4)
                      : isSelected!
                          ? Colors.transparent
                          : Color(0xFFE4E4E4))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3 * SizeConfig.blockWidth,
                ),
                Icon(
                  icon,
                  color: (isSelected!) ? Colors.white : Colors.grey,
                ),
                SizedBox(
                  height: 3 * SizeConfig.blockWidth,
                ),
                Text(text ?? "None",
                    style: (isSelected!)
                        ? TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16)
                        : TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 16)),
                SizedBox(
                  height: 3 * SizeConfig.blockWidth,
                ),
              ],
            ),
          ),
        ));
  }
}
