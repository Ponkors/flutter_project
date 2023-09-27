import 'package:admin_panel/admin_panel.dart';
import 'package:admin_panel/ui/buttons.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UserRoleForm extends StatefulWidget {
  final String role;
  final Function(String role) onSave;

  const UserRoleForm({
    required this.role,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<UserRoleForm> createState() => _UserRoleFormState();
}

class _UserRoleFormState extends State<UserRoleForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String selectedRole;

  @override
  void initState() {
    super.initState();
    selectedRole = widget.role;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding_10,
        vertical: AppDimens.padding_30,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonFormField<UserRole>(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeData.primaryColor,
                  ),
                ),
              ),
              value: UserRoleExtension.fromStringValue(
                selectedRole,
              ),
              items: UserRole.values.map(
                (UserRole role) {
                  return DropdownMenuItem<UserRole>(
                    value: role,
                    child: Text(
                      role.getStringValue(),
                    ),
                  );
                },
              ).toList(),
              onChanged: (UserRole? value) {
                if (value != null) {
                  selectedRole = value.getStringValue();
                }
              },
            ),
            const SizedBox(height: AppDimens.size_20),
            Buttons(
              onPressedCancel: () {
                adminPanelBloc.add(
                  const NavigateToBackScreen(),
                );
              },
              onPressedSave: () {
                adminPanelBloc.add(
                  const NavigateToBackScreen(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
