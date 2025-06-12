import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileImageService {
  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.png';
      final savedImage = await File(picked.path).copy('${appDir.path}/$fileName');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image_path', savedImage.path);
      return savedImage;
    }
    return null;
  }

  static Future<File?> loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image_path');
    if (path != null && File(path).existsSync()) {
      return File(path);
    }
    return null;
  }
}
