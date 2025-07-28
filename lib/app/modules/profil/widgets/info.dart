import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skoolution/app/config/app_images.dart';

import '../../../config/app_constants.dart';

class profileAvatar extends StatelessWidget {
  const profileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: AppConstant.width * 0.3,
                    height: AppConstant.width * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      image: DecorationImage(
                        image: AssetImage(AppImages.profile),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right:0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        // border: Border.all(
                        //   color: Colors.black,
                        //   width: 2.0,
                        // ),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
        ],
      ),
    );
  }
}