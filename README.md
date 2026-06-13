# Attendance Management App

A two-screen Flutter application that manages the daily attendance state of 10 static students using the `provider` package.

---

## Instructions on How to Run the Project

Follow these steps to clone and run the project locally on your machine:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/msshakilhossain867/attendance_tracker.git](https://github.com/msshakilhossain867/attendance_tracker.git)


# State Management Architecture Explanation

## Why `ChangeNotifier` and `notifyListeners()` were used:

### ChangeNotifier:
It was used to cleanly separate the application's business logic from the UI components. By encapsulating the list of 10 static students and the attendance data within a provider class, the data becomes centrally accessible from any part of the app. This eliminates the need to pass data down through deep widget constructor nesting (Prop Drilling).

### notifyListeners():
This method is triggered inside the provider class whenever a student's attendance status is toggled via the CheckboxListTile. Invoking notifyListeners() automatically signals Flutter to rebuild all the active widgets listening to this state. This ensures that both Screen 1 (Attendance Screen) and Screen 2 (Summary Screen) remain seamlessly and instantly synchronized with the latest state without requiring any manual page refreshes.