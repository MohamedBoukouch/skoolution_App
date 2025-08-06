import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/app_images.dart';
import '../../../config/app_constants.dart';
import '../../notification/views/notification_view.dart';
import '../controllers/progression_controller.dart';

class ProgressionView extends GetView<ProgressionController> {
  const ProgressionView({super.key});

  @override
  Widget build(BuildContext context) {
    final features = ["Mathématiques", "S.V.T", "Philosophie", "Chimie", "English", "Physique"];
    final values = [0.9, 0.75, 0.8, 0.85, 0.7, 0.8];
    final List<RadarEntry> entries = values.map((v) => RadarEntry(value: v)).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: AppConstant.height * 0.12,
        title: Text(
          'Progression',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: AppConstant.titleFontSize,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppConstant.defaultPadding),
            child: IconButton(
              icon: SvgPicture.asset(
                AppImages.activeNotification,
                width: AppConstant.width * 0.06,
              ),
              onPressed: () => Get.to(() => const NotificationView()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstant.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Compétence développée",
              style: GoogleFonts.inter(
                fontSize: AppConstant.titleFontSize * 0.7,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppConstant.height * 0.03),
            Center(
              child: SizedBox(
                width: AppConstant.width * 0.8,
                height: AppConstant.width * 0.8,
                child: RadarChart(
                  RadarChartData(
                    dataSets: [
                      RadarDataSet(
                        dataEntries: entries,
                        fillColor: Colors.blueAccent.withOpacity(0.3),
                        borderColor: Colors.blueAccent,
                        borderWidth: 2,
                        entryRadius: 3,
                      ),
                    ],
                    radarShape: RadarShape.polygon,
                    tickCount: 5,
                    ticksTextStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: AppConstant.subtitleFontSize,
                    ),
                    tickBorderData: BorderSide(color: Colors.grey.shade300),
                    gridBorderData: BorderSide(color: Colors.grey.shade300),
                    getTitle: (index, _) => RadarChartTitle(
                      text: features[index],
                      angle: 0,
                      // style: GoogleFonts.inter(
                      //   fontSize: AppConstant.subtitleFontSize,
                      // ),
                    ),
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            SizedBox(height: AppConstant.height * 0.05),
            Wrap(
              spacing: AppConstant.defaultPadding,
              runSpacing: AppConstant.defaultPadding,
              alignment: WrapAlignment.center,
              children: [
                _buildCircularStat("Moyenne générale", 17.5, 20, Colors.blue, badgePin: true),
                _buildCircularStat("Mathématiques", 18, 20, Colors.blue, badgeTop: true),
                _buildCircularStat("Physique", 16.5, 20, Colors.teal),
                _buildCircularStat("Chimie", 14, 20, Colors.blueGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularStat(
    String title,
    double value,
    double max,
    Color color, {
    bool badgeTop = false,
    bool badgePin = false,
  }) {
    final percent = value / max;
    final cardWidth = AppConstant.width * 0.4;
    final progressSize = cardWidth * 0.5;

    return Container(
      width: cardWidth,
      height: cardWidth * 1.15,
      padding: EdgeInsets.all(AppConstant.defaultPadding * 0.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: progressSize,
                height: progressSize,
                child: CircularProgressIndicator(
                  value: percent,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Column(
                children: [
                  Text(
                    value.toString(),
                    style: GoogleFonts.inter(
                      fontSize: AppConstant.titleFontSize * 0.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "/$max",
                    style: GoogleFonts.inter(
                      fontSize: AppConstant.subtitleFontSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppConstant.defaultPadding * 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: AppConstant.subtitleFontSize * 0.9,
                  ),
                ),
              ),
              if (badgePin) ...[
                SizedBox(width: AppConstant.defaultPadding * 0.2),
                Icon(
                  Icons.push_pin,
                  size: AppConstant.subtitleFontSize,
                  color: Colors.grey,
                ),
              ],
              if (badgeTop) ...[
                SizedBox(width: AppConstant.defaultPadding * 0.2),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstant.defaultPadding * 0.2,
                    vertical: AppConstant.defaultPadding * 0.1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "TOP 5%",
                    style: GoogleFonts.inter(
                      fontSize: AppConstant.subtitleFontSize * 0.8,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}