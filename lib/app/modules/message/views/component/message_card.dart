import 'package:dikitis_web/app/constants/constants.dart';
import 'package:dikitis_web/app/models/message_model.dart';
import 'package:dikitis_web/app/utils/utils.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageCard({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(
              top: SizeConfig.blockWidth * 1.25,
              // bottom: SizeConfig.blockWidth * 0.4,
              left: SizeConfig.blockWidth * 10.0,
              right: SizeConfig.blockWidth * 1.75,
            )
          : EdgeInsets.only(
              top: SizeConfig.blockWidth * 1.25,
              // bottom: SizeConfig.blockWidth * 0.4,
              right: SizeConfig.blockWidth * 10.0,
              left: SizeConfig.blockWidth * 1.25),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockWidth, vertical: SizeConfig.blockWidth),
      decoration: BoxDecoration(
        color: isMe ? AppStyles.colors.bgDark.withOpacity(0.95) : Colors.cyan,
        borderRadius: isMe
            //chat dokter
            ? BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(0),
              )
            //chat pasien
            : BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.messageContent.toString(),
            style: AppStyles.textStyles.poppinsSemiBold.copyWith(
              color: AppStyles.colors.white,
              fontSize: SizeConfig.blockWidth * 1.2,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: SizeConfig.blockWidth * 1),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              (message.messageTime!).format(),
              style: AppStyles.textStyles.poppinsMedium.copyWith(
                color: AppStyles.colors.white.withOpacity(0.9),
                fontSize: SizeConfig.blockWidth,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
