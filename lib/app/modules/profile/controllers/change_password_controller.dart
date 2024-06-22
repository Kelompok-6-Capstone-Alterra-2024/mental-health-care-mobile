// controllers/password_controller.dart
import 'package:get/get.dart';
import '../data/models/change_password_model.dart';
import '../data/services/change_password_service.dart';

class PasswordController extends GetxController {
  var isLoading = false.obs;
  var statusMessage = ''.obs;
  final PasswordService passwordService;

  PasswordController(this.passwordService);

  Future<void> resetPassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    isLoading(true);

    final passwordModel = PasswordModel(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    final result = await passwordService.resetPassword(passwordModel);

    statusMessage.value = result['message'] ?? "Unknown error occurred";

    isLoading(false);
  }
}
