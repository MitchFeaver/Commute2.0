import 'package:flutter/cupertino.dart';

import 'dialogs.dart';

class SafeExecutor {
  static bool _isRunning = false;

  static void execute(BuildContext context, Function action, [bool showLoading = true, String? loadingMessage]) async {
    if (!_isRunning) {
      _isRunning = true;
      if (showLoading) {
        Dialogs.showLoadingDialog(context, loadingMessage);
      }
      await action();
      if (showLoading) {
        Dialogs.hideLoadingDialog(context);
      }
      _isRunning = false;
    }
  }
}