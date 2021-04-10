import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbook/controllers/navigation_controller.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:flutterbook/widgets/home_content.dart';
import 'package:flutterbook/widgets/my_posts_content.dart';
import 'package:mockito/mockito.dart';

class PostsControllerMock extends Mock implements PostsController {}

void main() {
  NavigationController controller;
  PostsControllerMock postsControllerMock;

  setUp(() {
    postsControllerMock = PostsControllerMock();
    controller = NavigationController(postsControllerMock);
  });

  group('Reactivity Test', () {
    setUp(() => when(postsControllerMock.isSearching).thenAnswer((_) => false));
    test('Should be able to be when page changed is one', () {
      controller.changePage(0);
      expect(controller.currentPageIndex, 0);
    });
    test('Should be able to be when page changed is two', () {
      controller.changePage(1);
      expect(controller.currentPageIndex, 1);
    });
  });

  group('Navigation Test', () {
    setUp(() {
      when(postsControllerMock.isSearching).thenAnswer((_) => false);
      controller.onInit();
    });
    test('Should be able to navigate to home content', () {
      controller.changePage(0);
      expect(controller.currentPage, isA<HomeContent>());
    });
    test('Should be able to navigate to my posts content', () {
      controller.changePage(1);
      expect(controller.currentPage, isA<MyPostsContent>());
    });
  });
}
