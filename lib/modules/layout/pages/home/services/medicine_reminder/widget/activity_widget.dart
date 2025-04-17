import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/home/services/medicine_reminder/models/medicine_model.dart';

class ActivityWidget extends StatefulWidget {
  final String medicineName;
  final int durationDays;
  final int timesPerDay;
  final Medicine medicine;
  final VoidCallback onUpdate;

  const ActivityWidget({
    super.key,
    required this.medicineName,
    required this.durationDays,
    required this.timesPerDay,
    required this.medicine,
    required this.onUpdate,
  });

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {

  late bool isTaken;

  @override
  void initState() {
    super.initState();
    isTaken = widget.medicine.isTaken;
  }

  void toggleTaken() {
    setState(() {
      isTaken = !isTaken;
      widget.medicine.isTaken = isTaken;
      widget.onUpdate();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppAssets.medicineActivities),
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  widget.medicineName,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                  "Duration: ${widget.durationDays} days",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                  "Times per day: ${widget.timesPerDay}",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey
                ),
              ),
            ],
                     ),
          IconButton(
              icon: Icon(
                isTaken
                ?Icons.check_circle
                :Icons.check_circle_outline,
                color: isTaken ? AppColors.darkGreen : AppColors.mentGreen,
              ),
              onPressed: toggleTaken,
          ),
        ],
      ),
    );
  }
}
