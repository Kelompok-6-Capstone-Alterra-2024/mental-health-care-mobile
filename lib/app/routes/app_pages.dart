import 'package:get/get.dart';
import 'package:mindease/app/modules/forum/detail_forum/views/post_forum_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/new_password_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/auth/views/verification_code_view.dart';
import '../modules/forum/bindings/forum_binding.dart';
import '../modules/forum/comment_forum/bindings/comment_forum_binding.dart';
import '../modules/forum/comment_forum/views/comment_forum_view.dart';
import '../modules/forum/detail_forum/bindings/detail_forum_binding.dart';
import '../modules/forum/detail_forum/views/detail_forum_view.dart';
import '../modules/forum/views/forum_view.dart';
import '../modules/home/ai_chat/bindings/ai_chat_binding.dart';
import '../modules/home/ai_chat/views/ai_chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/mood_track/add_mood/bindings/add_mood_binding.dart';
import '../modules/home/mood_track/add_mood/views/add_mood_view.dart';
import '../modules/home/mood_track/bindings/mood_track_binding.dart';
import '../modules/home/mood_track/views/mood_track_view.dart';
import '../modules/home/notification/bindings/notification_binding.dart';
import '../modules/home/notification/views/notification_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/meditation/article/bindings/article_binding.dart';
import '../modules/meditation/article/views/article_view.dart';
import '../modules/meditation/bindings/meditation_binding.dart';
import '../modules/meditation/music/views/music_view.dart';
import '../modules/meditation/story/bindings/story_binding.dart';
import '../modules/meditation/story/views/story_view.dart';
import '../modules/meditation/views/meditation_view.dart';
import '../modules/meditation/views/wishlist_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/onboarding/views/welcome_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/poin/bindings/poin_binding.dart';
import '../modules/profile/poin/views/poin_view.dart';
import '../modules/profile/transaction/bindings/transaction_binding.dart';
import '../modules/profile/transaction/views/transaction_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/views/screens/change_email_view.dart';
import '../modules/profile/views/screens/change_password_view.dart';
import '../modules/profile/views/screens/edit_profile_view.dart';
import '../modules/profile/views/screens/setting_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
          children: [
            GetPage(
              name: _Paths.ADD_MOOD,
              page: () => const AddMoodView(),
              binding: AddMoodBinding(),
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_CODE,
      page: () => const VerificationCodeView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORUM,
      page: () => const ForumView(),
      binding: ForumBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_FORUM,
          page: () => const DetailForumView(),
          binding: DetailForumBinding(),
        ),
        GetPage(
          name: _Paths.COMMENT_FORUM,
          page: () => const CommentForumView(),
          binding: CommentForumBinding(),
        ),
        GetPage(
          name: _Paths.POST_FORUM,
          page: () => const PostForumView(),
          binding: DetailForumBinding(),
        ),
      ],
    ),
     GetPage(
      name: _Paths.MEDITATION,
      page: () => const MeditationView(),
      binding: MeditationBinding(),
      children: [
        GetPage(
          name: _Paths.MUSIC,
          page: () => const MusicView(),
          binding: MeditationBinding(),
        ),
        GetPage(
          name: _Paths.ARTICLE,
          page: () => const ArticleView(),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: _Paths.STORY,
          page: () => const StoryView(),
          binding: StoryBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: MeditationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.EDIT_PROFILE,
          page: () => const EditProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.CHANGE_EMAIL,
          page: () => const ChangeEmailView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.SETTING,
          page: () => const SettingView(),
          binding: ProfileBinding(),
          children: [
            GetPage(
              name: _Paths.CHANGE_PASSWORD,
              page: () => const ChangePasswordView(),
              binding: ProfileBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.TRANSACTION,
          page: () => const TransactionView(),
          binding: TransactionBinding(),
        ),
        GetPage(
          name: _Paths.POIN,
          page: () => const PoinView(),
          binding: PoinBinding(),
        ),
      ],
    ),
  ];
}
