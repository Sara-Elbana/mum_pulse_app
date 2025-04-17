import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class TimePickerWidget extends StatefulWidget {
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay> onTimeSelected;
  const TimePickerWidget({
    super.key,
    this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.selectedTime;
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child){
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.mentGreen,
              colorScheme: const ColorScheme.light(
                primary: AppColors.mentGreen,
                onPrimary: Colors.white,
                surface: AppColors.white,
                onSurface: Colors.black,
                secondary: AppColors.mentGreen,
              ),
              buttonTheme: const ButtonThemeData(
              textTheme:  ButtonTextTheme.primary,
            ),
            ),
            child: child!,
        );
      }
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      widget.onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> _selectTime(context),
      child: Row(
        children: [
          const Icon(
            Icons.access_time,
            color: AppColors.mentGreen,
          ),
          const SizedBox(width: 10),
          Text(
            "Event Time",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            selectedTime == null
                ? "Choose Time"
                : '${selectedTime!.format(context)}',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: selectedTime == null ? AppColors.grey : AppColors.darkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
