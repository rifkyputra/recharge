class Person {
  final String name;
  final String email;
  final String? nickname;

  Person({
    required this.name,
    required this.email,
    this.nickname,
  });
}
