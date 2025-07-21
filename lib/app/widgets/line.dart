import 'package:flutter/material.dart';
import 'package:skoolution/app/config/app_constants.dart';

class Line extends StatelessWidget {
  final bool isActive;
  const Line({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:EdgeInsets.only(bottom: AppConstant.height*.03),
        width: AppConstant.width*.2,
        height: 3,
        color: isActive ? Colors.blue : Colors.blue[100],
        // margin: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}