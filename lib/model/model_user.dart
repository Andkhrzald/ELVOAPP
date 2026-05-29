class ModelUser {
  final int id;
  final String username;
  final String email;
  final String? token;

  ModelUser({
    required this.id,
    required this.username,
    required this.email,
    this.token,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'token': token,
    };
  }
}
