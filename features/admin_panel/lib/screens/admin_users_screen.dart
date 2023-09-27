import 'package:admin_panel/admin_panel.dart';
import 'package:admin_panel/ui/admin_user_item.dart';
import 'package:admin_panel/ui/app_bottom_sheet.dart';
import 'package:admin_panel/ui/user_role_form.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';


class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'adminPage.users'.tr(),
      ),
      body: BlocBuilder<AdminPanelBloc, AdminPanelState> (
        builder: (_, AdminPanelState state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: state.usersList.length,
                  itemBuilder: (_, int index) {
                    return AdminUserItem(
                      userModel: state.usersList[index],
                      onPressed: () {
                        AppBottomSheet.show(
                          context,
                          UserRoleForm(
                            onSave: (String role) {
                              adminPanelBloc.add(
                                UpdateUserRole(
                                  role: role,
                                  uid: state.usersList[index].identifierId,
                                ),
                              );
                              AppSnackBar.show(
                                context,
                                'adminPage.userRoleChanged'.tr(),
                              );
                            },
                            role: state.usersList[index].role,
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class AppSnackBar {
  static void show(
      BuildContext context,
      String message,
      ) {
    final ThemeData themeData = Theme.of(context);
    final snackbar = SnackBar(
      content: Text(
        message,
        style: themeData.textTheme.titleMedium!.copyWith(
          color: AppColors.white,
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
