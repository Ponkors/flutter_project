import 'package:equatable/equatable.dart';

class HeaderMenuItemEntity extends Equatable {
  final String image;

  const HeaderMenuItemEntity({
    required this.image,
  });

  @override
  List<Object?> get props => [
    image,
  ];
}
