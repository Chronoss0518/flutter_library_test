
import 'package:flutter/material.dart';
import 'package:ch_flutter_library/widget/components/image_drawer.dart';
import 'package:ch_flutter_library/widget/components/image_some_drawer.dart';
import 'package:ch_flutter_library/widget/scene_manager.dart';



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
      home: SceneManager(StartScene()),
    );
  }
}



class StartScene extends BaseScene {
  ImageSomeDrawerController controller = ImageSomeDrawerController();
  
  @override
  void init({SaveData? sendData}) {
    setAppBar(AppBar(
      backgroundColor: Theme.of(context!).colorScheme.inversePrimary,
      title: Center(child: Text("Title")),
    ));
    repaint(() {});
  }

  int testNumber = 0;

  @override
  void update() {
    if(testNumber == 0)
    {
      controller.drawLeft = (controller.drawLeft - 100) % controller.baseHeight;
      controller.drawTop = (controller.drawTop - 100) % controller.baseHeight;
    }
    controller.update();
    repaint(() {
      tmpUpdate();
    });
  }

  @override
  void release() {}

  void tmpUpdate() {
    testNumber++;
    testNumber %= 100;
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DrawText(
            'You have pushed the button this many times:',
          ),
          ImageSomeDrawer("resource/image/test_image.png",controller,width: 500,height:500,imageWidth: 1000,imageHeight:1000,),
          Container(
            margin: EdgeInsets.only(left: 100.0),
            color: Colors.red,
            child: Text(
              'Test:' + testNumber.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DrawText extends StatelessWidget {
  DrawText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
