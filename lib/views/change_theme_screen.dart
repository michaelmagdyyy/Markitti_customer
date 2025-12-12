import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../main.dart'; // To access _MyAppState

class ChangeThemeScreen extends StatefulWidget {
  const ChangeThemeScreen({super.key});

  @override
  State<ChangeThemeScreen> createState() => _ChangeThemeScreenState();
}

class _ChangeThemeScreenState extends State<ChangeThemeScreen> {
  String _selectedTheme = 'light';

  final List<Map<String, String>> _themes = [
    {
      "code": "light",
      "name": "Light Mode",
      "icon": "assets/images/light.png",
    },
    {
      "code": "dark",
      "name": "Dark Mode",
      "icon": "assets/images/dark.png",
    },
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedTheme =
    Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Change Theme",),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Choose your preferred theme".tr(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ..._themes.map((theme) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedTheme == theme["code"]
                        ? context.secondaryColor
                        : Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RadioListTile(
                  value: theme["code"]!,
                  groupValue: _selectedTheme,
                  onChanged: (value) {
                    setState(() {
                      _selectedTheme = value!;
                    });

                    final themeMode = value == 'dark'
                        ? ThemeMode.dark
                        : ThemeMode.light;


                    final appState =
                    context.findAncestorStateOfType<MyAppState>();
                    appState?.updateThemeMode(themeMode);
                  },
                  title: Row(
                    children: [
                      Image.asset(
                        theme["icon"]!,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Text(theme["name"]!.toString().tr()),
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
