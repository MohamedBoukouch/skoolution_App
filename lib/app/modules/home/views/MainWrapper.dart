import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/modules/cours/views/cours_view.dart';
import 'package:skoolution/app/modules/home/views/home_view.dart';
import 'package:skoolution/app/modules/login/views/login_view.dart';
import 'package:skoolution/app/modules/profil/views/profil_view.dart';

import '../../progression/views/progression_view.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late PageController pageController;
  late RxInt currentPage;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    currentPage = 0.obs;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changePage(int index) {
    currentPage.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true, // This is important for proper positioning
      body: SafeArea(
        bottom: false, // Allows content to go behind the navigation bar
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight), // Add space for nav bar
              child: const HomeView(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              child: CoursView(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              child: ProgressionView(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              child: ProfilView(),
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: currentPage.value,
              onTap: changePage,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.homeInactive,
                    width: 24,
                    height: 24,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.homeActive,
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.hatInactive,
                    width: 24,
                    height: 24,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.hatActive, // Fixed: Changed from hatInactive to hatActive
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  label: 'Matières',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.statistiqueInactive,
                    width: 24,
                    height: 24,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.statistiqueActive, // Fixed: Changed from inactive to active
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  label: 'Progression',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.profileInactive,
                    width: 24,
                    height: 24,
                    color: Colors.grey,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.profileActive, // Fixed: Changed from inactive to active
                    width: 24,
                    height: 24,
                    color: Colors.blue,
                  ),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}