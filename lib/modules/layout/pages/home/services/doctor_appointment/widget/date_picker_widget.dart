import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class DatePickerWidget extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerWidget({
    super.key,
    this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child){
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.mentGreen,
              buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              colorScheme: const ColorScheme.light(
                  primary: AppColors.mentGreen,
                onPrimary: Colors.white,
                surface: AppColors.white,
                onSurface: Colors.black,
                secondary: AppColors.mentGreen,
              ),
            ) ,
            child: child!,
        );
      }
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>_selectDate(context),
      child: Row(
        children: [
          const Icon(
            Icons.event_note,
            color: AppColors.mentGreen,
          ),
          const SizedBox(width: 10),
          Text(
            "Event Date",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            selectedDate == null
                ? "Choose Date"
                : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: selectedDate == null ? AppColors.grey : AppColors.darkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
