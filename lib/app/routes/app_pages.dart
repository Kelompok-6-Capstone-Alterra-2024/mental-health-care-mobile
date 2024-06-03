import 'package:get/get.dart';

import '../modules/home/ai_chat/bindings/ai_chat_binding.dart';
import '../modules/home/ai_chat/views/ai_chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/mood_track/bindings/mood_track_binding.dart';
import '../modules/home/mood_track/views/mood_track_view.dart';
import '../modules/home/notification/bindings/notification_binding.dart';
import '../modules/home/notification/views/notification_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.NOTIFICATION,
          page: () => const NotificationView(),
          binding: NotificationBinding(),
        ),
        GetPage(
          name: _Paths.AI_CHAT,
          page: () => const AiChatView(),
          binding: AiChatBinding(),
        ),
        GetPage(
          name: _Paths.MOOD_TRACK,
          page: () => const MoodTrackView(),
          binding: MoodTrackBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
  ];
}
