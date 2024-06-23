// models/password_model.dart
class PasswordModel {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  PasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "old_password": oldPassword,
      "new_password": newPassword,
      "new_password_confirm": confirmPassword,
    };
  }
}
