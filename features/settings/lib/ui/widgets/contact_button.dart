import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.9,
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding_20,
      ),
      child: Link(
        uri: Uri.parse('https://www.linkedin.com/in/vlad-kirichuk/'),
        builder: (BuildContext context, goToLink) {
          return ElevatedButton(
            onPressed: goToLink,
            child: Text(
              'settingsScreen.contactUs'.tr(),
              style: GoogleFonts.poppins(
                textStyle: AppFonts.normal_16,
              ),
            ),
          );
        },
      ),
    );
  }
}

