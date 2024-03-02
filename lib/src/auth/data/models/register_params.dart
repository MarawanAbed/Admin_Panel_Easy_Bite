class RegisterParams {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final String? fcmToken;

  RegisterParams(
      { this.email,
       this.password,
      this.firstName,
      this.lastName,
      this.phone,
      required this.passwordConfirmation,
      this.fcmToken});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'first_name': firstName ?? '',
      'last_name': lastName ?? '',
      'phone': phone ?? '',
      'email': email ?? '',
      'password': password ?? '',
      'password_confirmation': passwordConfirmation ?? '',
      'fcm_token': fcmToken ?? '',
    };

    // remove null values from map
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}
