import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbook/core/controllers/posts_controller.dart';
import 'package:flutterbook/core/repositories/api_repository.dart';
import 'package:flutterbook/features/home_page/models/post_model.dart';
import 'package:flutterbook/features/home_page/models/user_model.dart';
import 'package:mockito/mockito.dart';

class ApiRepositoryMock extends Mock implements ApiRepository {}

void main() {
  ApiRepositoryMock apiRepositoryMock;
  PostsController controller;
  List mockRepositoryData;

  setUp(() async {
    apiRepositoryMock = ApiRepositoryMock();
    controller = PostsController(apiRepositoryMock);
    mockRepositoryData = [
      PostModel(
        id: "1",
        answers: 1,
        date: DateTime.now(),
        user: controller.user,
        text: 'aaa',
      ),
      PostModel(
        id: "2",
        answers: 2,
        date: DateTime.now().add(Duration(days: 5)),
        user: controller.user,
        text: 'bbb',
      ),
      PostModel(
        id: "3",
        answers: 3,
        date: DateTime.now().add(Duration(days: 10)),
        user: UserModel(id: "1", name: "test", imageUrl: "imageUrl"),
        text: 'ccc',
      ),
    ];
    when(apiRepositoryMock.getPosts()).thenAnswer(
      (realInvocation) async => Future.value(
        [
          ...mockRepositoryData,
        ],
      ),
    );
  });

  group('Reactivity Test', () {
    group('Loading Test', () {
      test('After loading posts isLoading should be false', () async {
        await controller.onInit();
        expect(controller.loading, false);
      });
    });

    group('Filter Test', () {
      test('Filter should be equal change filter text', () {
        controller.changeFilter("a");
        expect(controller.filter, "a");
      });

      test('When clear filter, filter should be empty', () {
        controller.changeFilter("a");
        controller.clearFilter();
        expect(controller.filter.isEmpty, true);
      });
    });
    group('Search Test', () {
      test('When toggle search, isSearching value should be invert', () {
        expect(controller.isSearching, false);
        controller.toggleSearch();
        expect(controller.isSearching, true);
        controller.toggleSearch();
        expect(controller.isSearching, false);
      });
    });

    group('Posts Test', () {
      test('When get posts, the list should be sortted by date.', () async {
        await controller.onInit();
        var posts = mockRepositoryData;
        posts.sort((a, b) => b.date.compareTo(a.date));
        expect(controller.posts, posts);
      });

      test(
          'When get my posts, the list should contain only current user posts and be sortted by date.',
          () async {
        await controller.onInit();
        var posts = mockRepositoryData;
        posts.sort((a, b) => b.date.compareTo(a.date));
        var myPosts = posts
            .where((element) => element.user.id == controller.user.id)
            .toList();
        expect(controller.myPosts, myPosts);
      });

      test('When add post the list length should be increased', () async {
        await controller.onInit();
        var posts = mockRepositoryData;
        controller.createPost("my new post text");
        expect(controller.posts.length, posts.length + 1);
      });

      test('When delete post the list length should be decreased', () async {
        await controller.onInit();
        var posts = mockRepositoryData;
        controller.deletePost(posts[0]);
        expect(controller.posts.length, posts.length - 1);
      });

      test('When edit post, post.isEdited should be true', () async {
        await controller.onInit();
        var posts = mockRepositoryData;
        controller.editPost(posts[0].id, "my edited post");
        expect(posts[0].text, "my edited post");
        expect(posts[0].isEdited, true);
      });
    });
  });
}
