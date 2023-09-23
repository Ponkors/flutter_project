import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppLanguageSelector extends StatelessWidget {
  const AppLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding_10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'settingsScreen.selectLanguage'.tr(),
                style: GoogleFonts.poppins(
                  textStyle: AppFonts.normal_16,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.language,
                ),
                onPressed: () {
                  if (context.locale == const Locale('en', 'US')) {
                    context.setLocale(const Locale('pl', 'PL'));
                  } else {
                    context.setLocale(const Locale('en', 'US'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
