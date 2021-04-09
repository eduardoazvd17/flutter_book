import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:flutterbook/widgets/home_content.dart';
import 'package:flutterbook/widgets/my_posts_content.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationController extends GetxController {
  final PostsController _postsController;
  NavigationController(this._postsController);
  // Navigation
  RxInt _currentPageIndex = 0.obs;
  int get currentPageIndex => _currentPageIndex.value;
  void changePage(int index) => _currentPageIndex.value = index;
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
  RxList _pages = [
    HomeContent(Get.find<PostsController>()),
    MyPostsContent(Get.find<PostsController>()),
  ].obs;
  get currentPage => _pages[currentPageIndex];
}
