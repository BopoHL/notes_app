import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_style.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
  });

  final String labelText, hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.mediumGrey,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: AppStyle.fontStyle.copyWith(
            fontSize: 12,
            color: AppColors.mediumGrey,
          ),
          hintText: hintText,
          hintStyle: AppStyle.fontStyle.copyWith(
            fontSize: 16,
            color: AppColors.mediumGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFF79747E),
          ))),
    );
  }
}
