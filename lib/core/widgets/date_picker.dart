import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/locale_keys.g.dart';
import '../utils/extensions.dart';
import 'app_btn.dart';
import 'app_sheet.dart';

class CustomDatePicker extends StatefulWidget {
  final String title;
  final DateTime? initialDate;
  const CustomDatePicker({
    super.key,
    required this.title,
    this.initialDate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime? initialDate = widget.initialDate;
  @override
  Widget build(BuildContext context) {
    return CustomAppSheet(
      title: widget.title,
      children: [
        SizedBox(
          height: 240.h,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            maximumYear: DateTime.now().year,
            initialDateTime: initialDate,
            minimumDate: initialDate,
            onDateTimeChanged: (value) {
              initialDate = value;
            },
          ),
        ).withPadding(vertical: 24.h),
        AppBtn(
          title: LocaleKeys.confirm.tr(),
          onPressed: () => Navigator.pop(context, initialDate?.sameDay(DateTime.now()) == true ? null : initialDate),
        ).withPadding(bottom: 12.h),
      ],
    );
  }
}
