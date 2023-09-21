part of 'widgets.dart';

// dipakai di homescreen

class ListCardItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imagePath;
  final MaterialColor? color;
  final VoidCallback? function;

  const ListCardItem(
      {this.color = Colors.cyan,
      @required this.function,
      @required this.title,
      @required this.description,
      @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(
            (-SizeConfig.screenWidth * 8.5), 0.0, 0.0),
        child: GestureDetector(
          onTap: function!,
          child: Stack(
            children: <Widget>[
              //Card
              Padding(
                padding: EdgeInsets.only(
                    //ukuran setengah icon
                    top: SizeConfig.blockWidth * 12.0,
                    left: SizeConfig.blockWidth * 6.0,
                    bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(SizeConfig.blockWidth * 4),
                      bottomLeft: Radius.circular(SizeConfig.blockWidth * 4),
                      topLeft: Radius.circular(SizeConfig.blockWidth * 4),
                      topRight: Radius.circular(SizeConfig.blockWidth * 12),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 15 * SizeConfig.blockWidth,
                      left: 5 * SizeConfig.blockWidth,
                      right: 5 * SizeConfig.blockWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100 * SizeConfig.blockWidth,
                          color: Colors.transparent,
                          padding: EdgeInsets.only(
                              bottom: 2 * SizeConfig.blockWidth),
                          child: Text(
                            title!,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 5 * SizeConfig.blockWidth,
                              letterSpacing: 0.5,
                              color: Colors.black.withOpacity(0.85),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 65 * SizeConfig.blockWidth,
                          child: Text(
                            description!,
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 3.3 * SizeConfig.blockWidth,
                              height: 1.3,
                              letterSpacing: 0.3,
                              color: AppStyles.colors.bgDark.withOpacity(0.85),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Icon
              Positioned(
                top: 0,
                left: 6 * SizeConfig.blockWidth,
                child: Image.asset(
                  imagePath!,
                  height: 24 * SizeConfig.blockWidth,
                ),
              ),
              //Arrow
              Positioned(
                  bottom: 5 * SizeConfig.blockWidth,
                  right: 5 * SizeConfig.blockWidth,
                  child: Container(
                      padding: EdgeInsets.all(2 * SizeConfig.blockWidth),
                      decoration: BoxDecoration(
                          color: color!,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: color!,
                            width: 1.5,
                          )),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 6 * SizeConfig.blockWidth,
                      ))),
            ],
          ),
        ));
  }
}
