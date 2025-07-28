import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsContainer extends StatelessWidget {
  final String svgAssetPath;  // Changed from IconData to String for SVG path
  final String text;
  final bool isDarkMode;
  final bool isLanguage;
  final String? languageText;
  
  const SettingsContainer({
    super.key,
    required this.svgAssetPath,  // Now expects an asset path
    required this.text,
    this.isDarkMode = false,
    this.isLanguage = false,
    this.languageText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 218, 219, 218).withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(90, 186, 202, 228),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                svgAssetPath,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          if (isLanguage)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "Français",
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 15, 15, 15),
                ),
              ),
            ),
          if (isDarkMode)
            Switch(
              value: false, // You'll need to manage this state
              onChanged: (value) {},
              activeColor: Colors.blue,
            )
          else
            Icon(Icons.chevron_right, color: const Color.fromARGB(255, 148, 145, 145)),
        ],
      ),
    );
  }
}