class UserEntity {
  final String identifierId;
  final String userName;
  final String email;

  const UserEntity({
    required this.identifierId,
    required this.userName,
    required this.email,
  });

  List<Object?> get props => [
    identifierId,
    userName,
    email,
  ];

  const UserEntity.empty()
      : identifierId = '',
        userName = '',
        email = '';
}