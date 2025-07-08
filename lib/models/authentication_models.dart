class Post {
    int id;
    String username;
    String email;
    String firstName;
    String lastName;
    String gender;
    String image;
    String accessToken;
    String refreshToken;

    Post({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.accessToken,
        required this.refreshToken,
    });

factory Post.fromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'],
    username: json['username'],
    email: json['email'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    gender: json['gender'],
    image: json['image'],
    accessToken: json['accessToken'],
    refreshToken: json['refreshToken'],
  );
}
}
