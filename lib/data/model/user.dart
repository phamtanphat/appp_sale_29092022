class User {
  String email = "";
  String name = "";
  String phone = "";
  String token = "";

  User(this.email, this.name, this.phone, this.token);

  @override
  String toString() {
    return 'User{email: $email, name: $name, phone: $phone, token: $token}';
  }
}
