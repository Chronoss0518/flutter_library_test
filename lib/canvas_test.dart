import 'package:flutter/material.dart';

class CanvasTest extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CanvasTest>
{
  @override
  Widget build(BuildContext context)
  {
    return CustomPaint(
      painter: TestCustomPainter(),
    );
  }
}

class TestCustomPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size)
  {
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)
  {
    throw false;
  }
}
