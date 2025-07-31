import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robot Arm Controller',
      home: RobotArmPage(),
    );
  }
}

class RobotArmPage extends StatefulWidget {
  @override
  _RobotArmPageState createState() => _RobotArmPageState();
}

class _RobotArmPageState extends State<RobotArmPage> {
  double motor1 = 0;
  double motor2 = 0;
  double motor3 = 0;
  double motor4 = 0;

  List<List<double>> savedPoses = [];

  void resetMotors() {
    setState(() {
      motor1 = 0;
      motor2 = 0;
      motor3 = 0;
      motor4 = 0;
    });
  }

  void runMotors() {
    print("Running motors:");
    print("Motor 1: $motor1");
    print("Motor 2: $motor2");
    print("Motor 3: $motor3");
    print("Motor 4: $motor4");
  }

  void savePose() {
    setState(() {
      savedPoses.add([motor1, motor2, motor3, motor4]);
    });
  }

  void runSavedPose(List<double> pose) {
    setState(() {
      motor1 = pose[0];
      motor2 = pose[1];
      motor3 = pose[2];
      motor4 = pose[3];
    });
    runMotors();
  }

  void stopMotors() {
    print("Motors stopped.");
  }

  Widget buildSlider(String label, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toInt()}'),
        Slider(
          value: value,
          min: 0,
          max: 180,
          divisions: 180,
          label: value.toInt().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget buildSavedPoses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Saved Poses:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        for (int i = 0; i < savedPoses.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Pose ${i + 1}: M1=${savedPoses[i][0].toInt()}, M2=${savedPoses[i][1].toInt()}, M3=${savedPoses[i][2].toInt()}, M4=${savedPoses[i][3].toInt()}',
                ),
              ),
              IconButton(
                icon: Icon(Icons.play_arrow, color: Colors.green),
                onPressed: () {
                  runSavedPose(savedPoses[i]);
                },
              ),
              IconButton(
                icon: Icon(Icons.stop, color: Colors.red),
                onPressed: () {
                  stopMotors();
                },
              ),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Robot Arm Controller')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSlider('Motor 1', motor1, (val) => setState(() => motor1 = val)),
            buildSlider('Motor 2', motor2, (val) => setState(() => motor2 = val)),
            buildSlider('Motor 3', motor3, (val) => setState(() => motor3 = val)),
            buildSlider('Motor 4', motor4, (val) => setState(() => motor4 = val)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: runMotors, child: Text('Run')),
                ElevatedButton(
                  onPressed: resetMotors,
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton(
                  onPressed: savePose,
                  child: Text('Save Pose'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildSavedPoses(),
          ],
        ),
      ),
    );
  }
}