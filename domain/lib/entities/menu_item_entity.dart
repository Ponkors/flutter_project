import 'package:equatable/equatable.dart';

class MenuItemEntity extends Equatable {
  final String image;
  final String name;

  const MenuItemEntity({
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [
    image,
    name,
  ];
}
