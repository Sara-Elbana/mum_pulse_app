import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPass;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;
  final bool? isExpanded;
  final TextStyle? hintStyle;
  final Color? color;
  final TextInputType? keyboardType;
  final void Function(String value)? onChanged;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.isPass = false,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.isExpanded,
    this.hintStyle,
    this.onChanged,
    this.color,
    this.keyboardType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    final borderColor = widget.color ?? AppColors.purple;
    final isPassword = widget.isPass;
    final isExpanded = isPassword ? false : widget.isExpanded ?? false;
    final minLines = isPassword ? 1 : widget.minLines;
    final maxLines = isPassword ? 1 : widget.maxLines;
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPass? isShow : false ,
      expands: isExpanded,
      minLines: isExpanded ? null : minLines,
      maxLines: isExpanded ? null : maxLines,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(color: borderColor)),
        alignLabelWithHint: true,
    suffixIcon: widget.isPass? IconButton(
            onPressed: () {
               isShow =!isShow;
               setState(() {});
             },
             icon: Icon( isShow? Icons.remove_red_eye_outlined
                 : Icons.visibility_off_outlined
             )
         ): widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
