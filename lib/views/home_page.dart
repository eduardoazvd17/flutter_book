import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() => _navigationBar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Obx(() => _homeController.currentPage),
          ),
        ),
      ),
    );
  }

  _addButton() => FloatingActionButton(
        child: Icon(
          CupertinoIcons.add,
          color: Get.theme.scaffoldBackgroundColor,
        ),
        onPressed: () {
          //TODO: Abrir página de novo post.
        },
      );

  _navigationBar() => BottomNavigationBar(
        currentIndex: _homeController.currentPageIndex,
        items: _homeController.navigationItems,
        onTap: _homeController.changePage,
      );
}
