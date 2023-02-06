import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../generated/locale/locale_keys.g.dart';

part '../../../generated/lib/base/providers/dialogs/common/provider.g.dart';

@Riverpod(keepAlive: true)
DialogsProvider dialogs(DialogsRef ref) => DialogsProvider();

class DialogsProvider {
  showOKDialog(BuildContext context,
      {required String message,
      required String title,
      String? textOK,
      VoidCallback? onOKPressed,
      Widget? content,
      bool barrierDismissible = false}) {
    AwesomeDialog(
      dialogType: DialogType.noHeader,
      context: context,
      title: title,
      desc: message,
      btnOkText: textOK,
      btnOk: ElevatedButton(
        onPressed: onOKPressed ?? () => Navigator.of(context).pop(),
        child: Text(textOK ?? LocaleKeys.generic_ok.tr()),
      ),
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(20)),
      body: content,
      dismissOnTouchOutside: barrierDismissible,
      btnOkOnPress: onOKPressed ?? () => {},
    ).show();
  }

  showYesNoDialog(BuildContext context,
      {required String message,
      required String title,
      String? textYes,
      String? textNo,
      VoidCallback? onYesPressed,
      VoidCallback? onNoPressed,
      Widget? content,
      bool barrierDismissible = false}) {
    AwesomeDialog(
      dialogType: DialogType.noHeader,
      context: context,
      title: title,
      desc: message,
      btnOkText: textYes,
      btnCancelText: textNo,
      body: content,
      btnOk: ElevatedButton(
        onPressed: onYesPressed ?? () => Navigator.of(context).pop(),
        child: Text(textYes ?? LocaleKeys.generic_yes.tr()),
      ),
      btnCancel: ElevatedButton(
        onPressed: onNoPressed ?? () => Navigator.of(context).pop(),
        child: Text(textYes ?? LocaleKeys.generic_cancel.tr()),
      ),
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(5)),
      buttonsTextStyle: Theme.of(context).textTheme.bodyLarge,
      dismissOnTouchOutside: barrierDismissible,
      btnCancelOnPress: onNoPressed ?? () => {},
      btnOkOnPress: onYesPressed ?? () => {},
    ).show();
  }
}
