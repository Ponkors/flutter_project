import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: mediaQuery.size.width * 0.9,
      height: mediaQuery.size.height * 0.06,
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding_20,
      ),
      child: Link(
        uri: Uri.parse('https://www.linkedin.com/in/vlad-kirichuk/'),
        builder: (BuildContext context, goToLink) {
          return ElevatedButton(
            onPressed: goToLink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'settingsScreen.contactButton'.tr(),
                  style: GoogleFonts.poppins(
                    textStyle: AppFonts.normal_16,
                  ),
                ),
                SizedBox(width: AppDimens.size_10),
                Icon(
                  Icons.psychology_outlined,
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.radius_16),
              ),
            ),
          );
        },
      ),
    );
  }
}

