import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'attendance_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    double presentPercent = provider.students.isEmpty ? 0 : provider.presentCount / provider.students.length;
    double absentPercent = provider.students.isEmpty ? 0 : provider.absentCount / provider.students.length;

    return Scaffold(
      backgroundColor: const Color(0xffEEF5FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Attendance Summary",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircularIndicator("Present", provider.presentCount, presentPercent, const Color(0xff10E268), const Color(0xffc7efd5)),
                _buildCircularIndicator("Absent", provider.absentCount, absentPercent, const Color(0xff728BAA), const Color(0xffc5dbf6)),
              ],
            ),

            const SizedBox(height: 30),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(color: Colors.blue.withOpacity(.1), blurRadius: 15, offset: const Offset(0, 5))
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStudentList("Present Students:", provider.presentStudents.map((e) => e.name).join(", ")),
                      const Divider(height: 30),
                      _buildStudentList("Absent Students:", provider.absentStudents.map((e) => e.name).join(", ")),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularIndicator(String title, int count, double percent, Color color, Color bgColor) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff4A5568))),
        const SizedBox(height: 12),
        CircularPercentIndicator(
          radius: 55,
          lineWidth: 10,
          percent: percent,
          progressColor: color,
          backgroundColor: bgColor,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$count/10", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text("(${(percent * 100).toInt()}%)", style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStudentList(String title, String names) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Text(names.isEmpty ? "None" : names, style: TextStyle(color: Colors.grey.shade700)),
      ],
    );
  }
}