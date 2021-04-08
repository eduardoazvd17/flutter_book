import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/navigation_controller.dart';
import 'package:flutterbook/widgets/main_layout.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final NavigationController _navigationController;
  HomePage(this._navigationController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => _navigationBar(),
      ),
      body: MainLayout(
        child: Obx(
          () => _navigationController.currentPage,
        ),
      ),
    );
  }

  _appBar() => AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 1,
        centerTitle: false,
        title: Obx(
          () => Text(_navigationController.currentPageIndex == 1
              ? "Meus Posts"
              : "FlutterBook"),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {
              //TODO: mostrar caixa de pesquisa.
            },
          ),
        ],
      );

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
        currentIndex: _navigationController.currentPageIndex,
        items: _navigationController.navigationItems,
        onTap: _navigationController.changePage,
      );
}
