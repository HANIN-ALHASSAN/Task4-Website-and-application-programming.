# 🤖 Robot Arm Controller App (Flutter)

A Flutter application to control a virtual robot arm using 4 sliders, with the ability to save poses (positions) and replay them later.

---

## 📱 App Features

- Control 4 motors using sliders.
- Run button to execute the current motor values.
- Reset button to reset all motors to 0.
- Save Pose button to store the current values locally.
- Saved Poses list displays all saved motor positions.
- Each saved pose has:
  - ▶️ Button to replay the pose.
  - ⏹️ Button to stop (currently just prints a message).

---

## 🛠️ Steps to Run the Project

### 1. Setup Environment
Make sure the following are installed:
- Flutter SDK ✅  
- Android Studio or Visual Studio Code ✅  
- Android Emulator or a real connected device ✅  

### 2. Running the App
1. Open the project in Android Studio or VS Code.  
2. Run the following in the terminal:
   ```bash
   flutter pub get
   flutter run
  ### Project Structure
   /lib
     └── main.dart         # Main UI implementation
- /android
- /ios
- /pubspec.yaml           # Flutter dependencies and configuration
