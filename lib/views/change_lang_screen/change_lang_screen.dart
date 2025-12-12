import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui; // For Bidi.isRtlLanguage

import '../../blocs/change_lang/change_lang_bloc.dart';
import '../../core/services/service_locator.dart';
import '../../models/user.dart';
class ChangeLangScreen extends StatefulWidget {
  const ChangeLangScreen({super.key});

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState extends State<ChangeLangScreen> {
  late final bloc = sl<ChangeLangBloc>();

  String _selectedLang = 'en'; // default selected language code

  final List<Map<String, String>> _languages = [
    {
      "code": "ar",
      "name": "اللغة العربية",
      "flag": "assets/images/egyptlogo.png", // Add your Egypt flag image
    },
    {
      "code": "en",
      "name": "English",
      "flag": "assets/images/uslogo.png", // Add your US flag image
    },
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLang = context.locale.languageCode ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Change Language",),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose your preferred language".tr(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ..._languages.map((lang) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedLang == lang["code"]
                        ? context.secondaryColor
                        : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RadioListTile(
                  value: lang["code"]!,
                  groupValue: _selectedLang,
                  onChanged: (value) async {
                    setState(() {
                      _selectedLang = value!;
                    });
                    // Change language in EasyLocalization
                    await context.setLocale(Locale(value!));
                    // Here you can call your Bloc to change language
                    bloc.add(ChangeLangEvent(lang: value.toString()));
                  },
                  title: Row(
                    children: [
                      Image.asset(
                        lang["flag"]!,
                        width: 30,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Text(lang["name"]!),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
