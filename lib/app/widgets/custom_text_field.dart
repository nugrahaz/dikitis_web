part of 'widgets.dart';

class CustomTextField extends StatefulWidget {
  final bool? visibility;
  final bool? enabled;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final IconData? iconSuffix;

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool? useSuffixIcon;
  final Function()? function;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final double? borderRadius;
  final List<TextInputFormatter>? filteringTextInputFormatter;
  final TextCapitalization? textCapitalization;

  const CustomTextField({
    Key? key,
    @required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.visibility = false,
    this.useSuffixIcon = false,
    this.function,
    this.height,
    required this.currentNode,
    required this.nextNode,
    this.borderRadius = 12,
    this.filteringTextInputFormatter,
    this.textCapitalization,
    this.enabled = true,
    this.iconSuffix = Icons.remove_red_eye,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    if (widget.nextNode != null) {
      _focusNode = widget.nextNode;
    } else {
      _focusNode = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.height == null)
          ? SizeConfig.blockHeight * 3.9 + SizeConfig.blockWidth *3.9
          : widget.height,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 1.25 + SizeConfig.blockHeight * 1.25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            enabled: widget.enabled,
            autocorrect: false,
            enableSuggestions: widget.visibility != true ? true : false,
            enableIMEPersonalizedLearning:
                widget.visibility != true ? true : false,
            enableInteractiveSelection:
                widget.visibility != true ? true : false,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            inputFormatters: widget.filteringTextInputFormatter ?? [],
            style: AppStyles.textStyles.poppinsMedium.copyWith(
                color: AppStyles.colors.bgDark.withOpacity(0.9),
                fontWeight: FontWeight.w300,
                letterSpacing: 0.1,
                wordSpacing: 0.2,
                fontSize: SizeConfig.blockWidth *1.4 + SizeConfig.blockHeight * 0.4),
            obscureText: widget.visibility!,
            focusNode: widget.currentNode,
            onFieldSubmitted: (term) {
              SharedMethod.fieldFocusChange(
                  context, widget.currentNode!, _focusNode!);
            },
            controller: widget.controller,
            onChanged: widget.onChanged,
            textInputAction: (widget.nextNode == null)
                ? TextInputAction.done
                : TextInputAction.next,
            cursorColor: AppStyles.colors.cyan,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              icon: Icon(
                widget.icon,
                size: SizeConfig.blockWidth *1.5 + SizeConfig.blockHeight * 1.5,
                color: AppStyles.colors.cyan,
              ),
              suffixIcon: (widget.useSuffixIcon == true)
                  ? GestureDetector(
                      onTap: widget.function,
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.blockWidth *2.0),
                          child: Icon(
                            (widget.iconSuffix != null)
                                ? widget.iconSuffix
                                : (widget.visibility == true)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                            color: AppStyles.colors.cyan,
                            size: SizeConfig.blockWidth *1.5 + SizeConfig.blockHeight * 1.5,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
