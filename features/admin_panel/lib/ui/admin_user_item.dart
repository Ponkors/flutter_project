import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:authentication/authentication.dart';

class AdminUserItem extends StatelessWidget {
  final VoidCallback onPressed;
  final UserModel userModel;

  const AdminUserItem({
    required this.onPressed,
    required this.userModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.padding_20,
          vertical: AppDimens.padding_10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userModel.userName,
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_16,
                  ),
                ),
                Text(
                  userModel.email,
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_16,
                  ),
                ),
              ],
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (_, AuthenticationState state) {
                return state.userModel.role ==
                    UserRole.developer.getStringValue()
                  ? ElevatedButton.icon(
                      icon: const Icon(
                        Icons.admin_panel_settings,
                      ),
                      label: Text(
                        'adminPage.changeRole'.tr(),
                      ),
                      onPressed: onPressed,
                )
                    : const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}

