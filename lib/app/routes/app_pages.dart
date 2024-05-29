import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/meditation/bindings/meditation_binding.dart';
import '../modules/meditation/views/article_view.dart';
import '../modules/meditation/views/meditation_view.dart';
import '../modules/meditation/views/music_view.dart';
import '../modules/meditation/views/story_view.dart';
import '../modules/meditation/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MEDITATION,
      page: () => const MeditationView(),
      binding: MeditationBinding(),
    ),
    GetPage(
      name: _Paths.MUSIC,
      page: () => const MusicView(),
      binding: MeditationBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => const ArticleView(),
      binding: MeditationBinding(),
    ),
    GetPage(
      name: _Paths.STORY,
      page: () => const StoryView(),
      binding: MeditationBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: MeditationBinding(),
    ),
  ];
}
