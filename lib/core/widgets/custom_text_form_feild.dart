import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  bool isPassword;
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && isObscure,
      validator: widget.validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyle.hintText.copyWith(color: AppColors.grayColor),
      ),
    );
  }
}
