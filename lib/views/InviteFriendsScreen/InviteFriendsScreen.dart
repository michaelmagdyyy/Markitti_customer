import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app_btn.dart';
class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Invite Friends",),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Code field
            TextField(
              readOnly: true,
              controller: TextEditingController(
                text: "ie78dgasvc67edqwy8a79g",
              ),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),

            AppBtn(
                title: "Generate Invitation Code".tr(),
                onPressed: () {
                }),
            const SizedBox(height: 20),

            // Share Via
            const Text(
              "Share Via",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareButton(Icons.facebook, "Messenger"),
                // _buildShareButton(Icons.whatsapp, "WhatsApp"),
                _buildShareButton(Icons.copy, "Copy Code"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildShareButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}