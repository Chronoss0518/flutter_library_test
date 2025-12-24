import 'package:flutter/material.dart';
import 'package:ch_flutter_library/widget/scene_manager.dart';
import 'startScene.dart';

enum TestType {
  baseSceneTest,
  canvasTest,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartWidget(TestType.baseSceneTest),
    );
  }
}

class StartWidget extends StatefulWidget {
  const StartWidget(this.type, {super.key});

  final TestType type;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case TestType.baseSceneTest:
        return SceneManager(StartScene());
      case TestType.canvasTest:
    }
    return SceneManager(StartScene());
  }
}
