import 'package:flutterbook/controllers/navigation_controller.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController(Get.find<PostsController>()));
  }
}
