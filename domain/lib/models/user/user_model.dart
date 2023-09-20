class UserModel {
  final String identifierId;
  final String userName;
  final String email;

  const UserModel({
    required this.identifierId,
    required this.userName,
    required this.email
  });

  List<Object?> get props => [
    identifierId,
    userName,
    email,
  ];

  UserModel copyWith({
    String? identifierId,
    String? username,
    String? email,
  }) {
    return UserModel(
      identifierId: identifierId ?? this.identifierId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }

  const UserModel.empty() :
    identifierId = '',
    userName = '',
    email = '';
}