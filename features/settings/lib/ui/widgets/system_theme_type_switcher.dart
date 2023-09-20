import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:settings/settings.dart';
import 'package:flutter/material.dart';

class SystemThemeTypeSwitcher extends StatelessWidget {
  const SystemThemeTypeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Card(
          shadowColor: AppColors.lightGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimens.radius_16),
            ),
          ),
          child: Container(
            width: mediaQuery.size.width * 0.9,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding_10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'settingsScreen.useSystemTheme'.tr(),
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_16,
                  ),
                ),
                Switch(
                  value: state.systemTheme,
                  onChanged: (bool value) {
                    bloc.add(
                      ChangeThemeType(isSystemTheme: value),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
