import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class AppThemeModeSelector extends StatelessWidget {
  const AppThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (
          _,
          SettingsState state,
          ) {
        if (state.systemTheme) {
          return const SizedBox.shrink();
        } else {
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
                    'settingsScreen.useAppTheme'.tr(),
                    style: GoogleFonts.poppins(
                      textStyle: AppFonts.normal_16,
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'settingsScreen.lightTheme'.tr(),
                              style: GoogleFonts.poppins(
                                textStyle: AppFonts.normal_14,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.lightbulb,
                                color: AppColors.yellow,
                              ),
                              onPressed: () {
                                bloc.add(
                                  ChangeThemeMode(isDark: false),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'settingsScreen.darkTheme'.tr(),
                              style: GoogleFonts.poppins(
                                textStyle: AppFonts.normal_14,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.dark_mode,
                                color: AppColors.grey,
                              ),
                              onPressed: () {
                                bloc.add(
                                  ChangeThemeMode(isDark: true),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
