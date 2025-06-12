import 'package:flutter/material.dart';

class EditDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String initialValue,
    required void Function(String newValue, String? password) onSave,
    bool isEmail = false,
  }) {
    final controller  = TextEditingController(text: initialValue);
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.all(20),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextFormField(
                  controller: controller,
                decoration:  const InputDecoration(
                    labelText: "New Value",
                  border: OutlineInputBorder(),
                ),
              ),
              if(isEmail)...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Current Password",
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onSave(
                        controller.text.trim(),
                        isEmail ? passwordController.text.trim() : null,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
