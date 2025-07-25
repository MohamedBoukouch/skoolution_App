import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skoolution/app/config/app_images.dart';
import 'package:skoolution/app/modules/home/views/home_view.dart';
import 'package:skoolution/app/modules/login/views/login_view.dart';
import 'package:skoolution/app/modules/signup/views/signup_view.dart';

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
      extendBody: true, // For better floating nav bar appearance
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
          HomeView(),
          SignupView(),
          LoginView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: currentPage.value,
          onTap: changePage,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items:  [
            BottomNavigationBarItem(
            icon: Image.asset(AppImages.homeInactive),
            activeIcon: Image.asset(AppImages.homeActive),
            label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.hatInactive),
              activeIcon: Image.asset(AppImages.hatActive),
              label: 'Matières',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.statistiqueInactive),
              activeIcon: Image.asset(AppImages.statistiqueActive),
              label: 'Progression ',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.profileInactive),
              activeIcon: Image.asset(AppImages.profileActive),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}