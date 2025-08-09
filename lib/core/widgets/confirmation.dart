import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/locale_keys.g.dart';
import '../routes/app_routes_fun.dart';
import '../utils/extensions.dart';

Future showMyDialog({required Widget child, bool isDismissible = true}) async {
  return await showDialog(
    barrierDismissible: isDismissible,
    builder: (context) => SimpleDialog(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
        children: [child]),
    context: navigator.currentContext!,
  );
}

enum ConfirmationDialogType {
  deleteAccount,
  logOut,
  deleteOrder,
  closeApp,
}

class ConfirmationDialog extends StatelessWidget {
  final Function? onTap;
  final ConfirmationDialogType type;

  const ConfirmationDialog({super.key, required this.type, this.onTap});

  String getTitle() {
    switch (type) {
      case ConfirmationDialogType.deleteAccount:
        return LocaleKeys.deleteAccount.tr();

      case ConfirmationDialogType.logOut:
        return LocaleKeys.logout.tr();
      case ConfirmationDialogType.closeApp:
        return "إغلاق التطبيق";

      case ConfirmationDialogType.deleteOrder:
        return "حذف الطلب";
    }
  }

  String getDesc() {
    switch (type) {
      case ConfirmationDialogType.deleteAccount:
        return LocaleKeys.confirmDeleteAccount.tr();
      case ConfirmationDialogType.closeApp:
        return "هل تريد الخروج من التطبيق ؟";

      case ConfirmationDialogType.logOut:
        return LocaleKeys.confirmLogout.tr();

      case ConfirmationDialogType.deleteOrder:
        return "هل تريد حذف طلبك ؟";
    }
  }

  String getImage() {
    switch (type) {
      case ConfirmationDialogType.deleteOrder:
      case ConfirmationDialogType.logOut:
      case ConfirmationDialogType.deleteAccount:
      case ConfirmationDialogType.closeApp:
        return "";
    }
  }

  String getConfirmationText() {
    switch (type) {
      case ConfirmationDialogType.deleteAccount:
      case ConfirmationDialogType.deleteOrder:
        return LocaleKeys.confirmNo.tr();

      case ConfirmationDialogType.logOut:
      case ConfirmationDialogType.closeApp:
        return LocaleKeys.confirmNo.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(getTitle(), style: context.boldText.copyWith(fontSize: 18)),
          Text(getDesc(), style: context.regularText.copyWith(color: context.hintColor)).withPadding(bottom: 20.h, top: 16.h),
          SizedBox(
              height: 40.h,
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (onTap != null) {
                            onTap!();
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: context.primaryColorLight,
                            shape: RoundedRectangleBorder(side: BorderSide(color: context.splashColor), borderRadius: BorderRadius.circular(80.r))),
                        child: Center(
                            child: Text(type == ConfirmationDialogType.deleteAccount ? LocaleKeys.confirmYes.tr() : LocaleKeys.confirmYes.tr(),
                                style: context.semiboldText.copyWith(color: context.splashColor))))),
                SizedBox(width: 16.w),
                Expanded(
                    child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: context.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.r))),
                        child: Text(getConfirmationText(), style: context.semiboldText.copyWith(color: Colors.white, fontSize: 12)))),
              ]))
        ]);
  }
}
