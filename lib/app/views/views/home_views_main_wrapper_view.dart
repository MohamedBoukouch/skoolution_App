import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeViewsMainWrapperView extends GetView {
  const HomeViewsMainWrapperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeViewsMainWrapperView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeViewsMainWrapperView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
