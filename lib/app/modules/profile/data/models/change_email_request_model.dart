class ChangeEmailRequest {
  final String email;
  final String code;

  ChangeEmailRequest({required this.email, required this.code});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}