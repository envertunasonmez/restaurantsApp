class AppUser {
  String id;
  String? username;
  String? email;
  String? password;

  AppUser({
    required this.id,
    this.username,
    this.email,
    this.password,
  });
}
