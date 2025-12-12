import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app_bar.dart';
class FollowUpInvitationsScreen extends StatelessWidget {
  const FollowUpInvitationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Follow up invitations",),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Your income this month",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "5000 L.E",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegend(Colors.blue, "Total invitations you send"),
                const SizedBox(width: 12),
                _buildLegend(Colors.lightBlueAccent, "Active Users"),
              ],
            ),
            const SizedBox(height: 20),

            // Bar Chart
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  barGroups: List.generate(8, (index) {
                    return BarChartGroupData(x: index, barRods: [
                      BarChartRodData(
                        toY: (index + 3) * 2,
                        color: Colors.blue,
                        width: 12,
                      )
                    ]);
                  }),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Invitation Code Cards
            _buildInvitationCard(
              code: "ie78dgasvc67edqwy8a79g",
              generatedOn: "1-6-2024 5:00 PM",
              registeredFor: "Michael Magdy",
              registeredOn: "",
            ),
            const SizedBox(height: 12),
            _buildInvitationCard(
              code: "jaudgw7vvu...t8www47",
              generatedOn: "1-6-2024 5:00 PM",
              registeredFor: "not yet",
              registeredOn: "not yet",
              color: Colors.red.shade50,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  static Widget _buildInvitationCard({
    required String code,
    required String generatedOn,
    required String registeredFor,
    required String registeredOn,
    Color color = Colors.blueGrey,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Invitation Code:", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(code, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 6),
          Text("Generated on: $generatedOn"),
          Text("Registered For: $registeredFor"),
          Text("Registered on: $registeredOn"),
        ],
      ),
    );
  }
}