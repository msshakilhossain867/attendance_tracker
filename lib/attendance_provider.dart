import 'package:flutter/material.dart';
import 'student.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> _students = List.generate(
    10,
        (index) => Student(name: "Student ${index + 1}"),
  );

  List<Student> get students => _students;

  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  int get presentCount => _students.where((e) => e.isPresent).length;
  int get absentCount => _students.where((e) => !e.isPresent).length;

  List<Student> get presentStudents => _students.where((e) => e.isPresent).toList();
  List<Student> get absentStudents => _students.where((e) => !e.isPresent).toList();
}