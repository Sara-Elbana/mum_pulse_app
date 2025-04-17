import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/layout/pages/setting/emergency_call/models/emergency_contact_model.dart';

class AddContactDialog extends StatefulWidget {
  final Function(EmergencyContact) onAdd;
  const AddContactDialog({super.key, required this.onAdd});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final relationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Emergency Contact"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: nameController,
              cursorColor: AppColors.mentGreen,
              decoration: const InputDecoration(
                  labelText: "Name",
                floatingLabelStyle: TextStyle(color: AppColors.darkGreen),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mentGreen),
                ),
              )),
          TextField(
              controller: phoneController,
              cursorColor: AppColors.mentGreen,
              decoration: const InputDecoration(
                  labelText: "Phone",
                floatingLabelStyle: TextStyle(color: AppColors.darkGreen),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mentGreen),
                ),
              ),
            keyboardType: TextInputType.number,
          ),
          TextField(
              controller: relationController,
              cursorColor: AppColors.mentGreen,
              decoration: const InputDecoration(
                  labelText: "Relation",
                floatingLabelStyle: TextStyle(color: AppColors.darkGreen),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mentGreen),
                ),
              )),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child:  Text(
                "Cancel",
              style: GoogleFonts.inter(
                color: AppColors.darkGreen,
              ),
            ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onAdd(EmergencyContact(
              name: nameController.text,
              phone: phoneController.text,
              relation: relationController.text,
            ));
            Navigator.pop(context);
          },
          child: Text(
              "Add",
            style: GoogleFonts.inter(
              color: AppColors.darkGreen,
            ),
          ),
        ),
      ],
    );
  }
}
