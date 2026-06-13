import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'attendance_provider.dart';
import 'attendance_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AttendanceProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance App',
      home: const AttendanceScreen(),
    );
  }
}