import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class CustomDropDownField extends StatefulWidget {
  final String label;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  final Color? color;

  const CustomDropDownField(
      {super.key,
      required this.label,
      this.value,
      required this.items,
      required this.onChanged,
      this.color});

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    final borderColor = widget.color ?? AppColors.purple;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          dropdownColor: AppColors.white,
          style: GoogleFonts.inter(
              color: AppColors.grey, fontSize: 16, fontWeight: FontWeight.w700),
          value: widget.value,
          onChanged: widget.onChanged,
          items: widget.items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
          ),
        ),
      ],
    );
  }
}
