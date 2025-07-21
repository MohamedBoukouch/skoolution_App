
import 'package:get/get.dart';

class AppConstant{

  static double get width => Get.width;
  static double get height => Get.height;


  // 4.5% of screen width as font size (responsive)
  static double get titleFontSize => width * 0.07;

  // Optional: Add more responsive sizes if needed
  static double get subtitleFontSize => width * 0.035;
  static double get defaultPadding => width * 0.05;
  
}