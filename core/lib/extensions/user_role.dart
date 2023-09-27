import 'package:core/core.dart';

extension UserRoleExtension on UserRole {
  String getStringValue() {
    switch (this) {
      case UserRole.admin:
        return 'admin';
      case UserRole.user:
        return 'user';
      default:
        return '';
    }
  }

  static UserRole fromStringValue(String value) {
    switch (value) {
      case 'admin':
        return UserRole.admin;
      case 'user':
        return UserRole.user;
      default:
        return UserRole.user;
    }
  }
}