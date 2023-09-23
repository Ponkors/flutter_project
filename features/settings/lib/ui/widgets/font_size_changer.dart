import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class FontSizeSlider extends StatelessWidget {
  const FontSizeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.padding_20,
          ),
          child: Card(
            shadowColor: AppColors.lightGrey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppDimens.radius_16),
              ),
            ),
            child: Container(
              width: mediaQuery.size.width * 0.9,
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimens.padding_10,
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'settingsScreen.changeFontSize'.tr(),
                    style: GoogleFonts.poppins(
                      textStyle: AppFonts.normal_16,
                    ),
                  ),
                  Slider(
                    value: state.textScale,
                    min: 0.5,
                    max: 1.1,
                    divisions: 3,
                    onChanged: (double textScaleValue) {
                      bloc.add(
                        ChangeFontSize(textScale: textScaleValue),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}