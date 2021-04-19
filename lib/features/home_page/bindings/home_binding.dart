import 'package:flutterbook/core/controllers/posts_controller.dart';
import 'package:flutterbook/features/home_page/controllers/navigation_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController(Get.find<PostsController>()));
  }
}
