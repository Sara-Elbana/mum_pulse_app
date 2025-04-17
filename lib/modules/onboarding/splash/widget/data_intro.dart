import 'package:flutter/cupertino.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';

class DataIntro{
  String image;
  String text;
  
  
  DataIntro({
   required this.image,
   required this.text, 
});
  
  static List<DataIntro> getDataList(BuildContext context){
    return[
      DataIntro(image: AppAssets.splash1, text: "Welcome to our app"),
      DataIntro(image: AppAssets.splash2, text: "In our app ,We will help you to raises\nyour child with your disability"),
      DataIntro(image: AppAssets.splash3, text: "We will help you to choose the best\nto your child through his life"),
    ];
  }
}