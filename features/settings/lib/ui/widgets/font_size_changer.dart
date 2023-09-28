import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class FontSizeSlider extends StatelessWidget {
  const FontSizeSlider({Key? key}) : super(key: key);

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
                width: mediaQuery.size.width * 0.8, // Update width here
                margin: const EdgeInsets.symmetric(
                  horizontal: AppDimens.padding_10,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.padding_10,
                      ),
                      child: Text(
                        'settingsScreen.changeFontSize'.tr(),
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_16,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.padding_10,
                          ),
                          child: SliderTheme(
                            data: themeData.sliderTheme.copyWith(),
                            child: Slider(
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
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'A',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: AppDimens.size_20,
                                  color: themeData.primaryColor,
                                ),
                              ),
                            ),
                            Text(
                              'A',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: AppDimens.size_30,
                                  color: themeData.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
