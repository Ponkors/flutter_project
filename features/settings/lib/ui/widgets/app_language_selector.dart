import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppLanguageSelector extends StatelessWidget {
  const AppLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
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
          horizontal: AppDimens.padding_20,
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
    );




    // return Container(
    //   padding: const EdgeInsets.all(
    //     AppDimens.padding_30,
    //   ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: <Widget>[
    //           Text(
    //             'settingsScreen.selectLanguage'.tr(),
    //             style: themeData.textTheme.titleMedium!.copyWith(
    //               color: themeData.primaryColor,
    //             ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               InkWell(
    //                 onTap: () {
    //                   if (context.locale == const Locale('pl', 'PL')) {
    //                     context.setLocale(
    //                       const Locale('en', 'US'),
    //                     );
    //                   }
    //                 },
    //                 child: Image.asset(
    //                   'assets/image/united-states.png',
    //                   width: 30,
    //                   height: 30,
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 20,
    //               ),
    //               InkWell(
    //                 onTap: () {
    //                   if (context.locale == const Locale('en', 'US')) {
    //                     context.setLocale(
    //                       const Locale('pl', 'PL'),
    //                     );
    //                   }
    //                 },
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     boxShadow: <BoxShadow>[
    //                       BoxShadow(
    //                         color: Colors.grey.withOpacity(0.5),
    //                         blurRadius: 2,
    //                         spreadRadius: 1,
    //                         offset: const Offset(0, 1),
    //                       ),
    //                     ],
    //                   ),
    //                   child: Image.asset(
    //                     'assets/image/poland.png',
    //                     width: 30,
    //                     height: 30,
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //       const SizedBox(
    //         height: AppDimens.size_60,
    //       ),
    //     ],
    //   ),
    // );
  }
}
