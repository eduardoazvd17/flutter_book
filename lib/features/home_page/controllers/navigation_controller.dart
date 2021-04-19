import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/core/controllers/posts_controller.dart';
import 'package:flutterbook/features/home_page/widgets/home_content.dart';
import 'package:flutterbook/features/home_page/widgets/my_posts_content.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationController extends GetxController {
  final PostsController _postsController;
  NavigationController(this._postsController);

  // Navigation Control
  RxInt _currentPageIndex = 0.obs;
  int get currentPageIndex => _currentPageIndex.value;
  void changePage(int index) {
    _postsController.clearFilter();
    if (_postsController.isSearching) _postsController.toggleSearch();
    _currentPageIndex.value = index;
  }

  // Navigation Items
  List<BottomNavigationBarItem> get navigationItems => [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: "Início",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.list_bullet),
          label: "Meus Posts",
        ),
      ];

  // Pages
  List _pages = [];
  get currentPage => _pages[currentPageIndex];

  @override
  void onInit() {
    super.onInit();
    _pages = [
      HomeContent(_postsController),
      MyPostsContent(_postsController),
    ];
  }
}
