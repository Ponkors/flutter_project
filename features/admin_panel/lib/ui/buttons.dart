import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onPressedSave;
  final VoidCallback onPressedCancel;

  const Buttons({
    required this.onPressedSave,
    required this.onPressedCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: AppDimens.size_20),
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: onPressedCancel,
            icon: const Icon(Icons.cancel_outlined),
            label: Text(
              'adminPage.cancel'.tr(),
            ),
          ),
        ),
        const SizedBox(width: AppDimens.size_30),
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: onPressedSave,
            icon: const Icon(Icons.save_as_outlined),
            label: Text(
              'adminPage.save'.tr(),
            ),
          ),
        ),
        const SizedBox(width: AppDimens.size_200)
      ],
    );
  }
}
