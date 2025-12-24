
import 'dart:async';

import 'package:flutter/material.dart';

class CanvasTest extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _State();
}

double x = 0,y = 0;
const moveSize = 0.1;

class _State extends State<CanvasTest>
{
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: (1000/ 60).toInt()), (timer){
      setState(() {
        x += moveSize;
        if(x > 1.0)x = 0;
        y += moveSize;
        if(y > 1.0)y = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return CustomPaint(
      painter: TestCustomPainter(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  Timer? _timer;
}

class TestCustomPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size)
  {
    final paint = Paint()
      ..strokeWidth = 2.0;

    List<Color> colors = [Colors.blue,Colors.red,Colors.yellow,Colors.green,Colors.deepPurple,Colors.amber];
    int maxWidth = ((size.width) / 100).toInt() + 3;
    int maxHeight = ((size.height) / 100).toInt() + 3;

    for(int i = 0; i < maxWidth; i++)
    {
      for(int j = 0; j < maxHeight; j++)
      {
        paint.color = colors[(i + j * maxWidth) % colors.length];
        canvas.drawRect(Rect.fromLTRB((i + x) * 100 - 150, (j + y) * 100 - 150, (i + x) * 100 + 150, (j + y) * 100 + 150), paint);
      }
    }
    canvas.save();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)
  {
    return false;
  }
}
