import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.index,
    this.title = '',
    this.text = '',
    this.date = '',
  });

  final String title, text, date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.lightPurpleColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: AppColors.blackColor.withOpacity(0.3),
                blurRadius: 2,
                spreadRadius: 0,
                offset: const Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.lightGreyColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(children: [
              Text(
                text,
                style: AppStyle.fontStyle.copyWith(
                  color: AppColors.mediumGrey,
                  fontSize: 14,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
