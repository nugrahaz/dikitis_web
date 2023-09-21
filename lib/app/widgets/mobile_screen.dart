import 'package:auto_size_text/auto_size_text.dart';
import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenTypeLayout extends StatefulWidget {
  final Widget child;

  const ScreenTypeLayout({super.key, required this.child});

  @override
  State<ScreenTypeLayout> createState() => _ScreenTypeLayoutState();
}

class _ScreenTypeLayoutState extends State<ScreenTypeLayout> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return (SizeConfig.screenWidth > 900 && SizeConfig.screenHeight > 530)
        ? widget.child
        : Container(
            width: double.infinity,
            height: double.infinity,
            color: AppStyles.colors.bgDark,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6 * SizeConfig.blockHeight,
                    bottom: 3 * SizeConfig.blockHeight),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: SizeConfig.blockWidth +
                              SizeConfig.blockHeight * 10.0,
                          maxHeight: 5 * SizeConfig.blockWidth +
                              SizeConfig.blockHeight * 25.0,
                        ),
                        child: Lottie.asset(
                          AssetsPath.lottie.sad,
                          reverse: false,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height:
                            SizeConfig.blockHeight * 2 + SizeConfig.blockWidth,
                      ),
                      Container(
                        height: 30 * SizeConfig.blockHeight,
                        width: 66 * SizeConfig.blockWidth,
                        child: Center(
                          child: AutoSizeText(
                            "Maaf, untuk saat ini tidak mendukung layar tablet atau yang lebih kecil, mohon untuk menggunakan desktop",
                            style: AppStyles.textStyles.poppinsSemiBold
                                .copyWith(
                                    color: Colors.white.withOpacity(0.85),
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                    fontSize: 2.5 * SizeConfig.blockWidth,
                                    height: 1.5),
                            textAlign: TextAlign.center,
                            minFontSize: 10,
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
