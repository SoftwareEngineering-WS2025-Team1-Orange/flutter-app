import 'package:flutter/material.dart';
import 'dart:math';

class RotatingCircle extends StatefulWidget {
  final int gaps;
  final Color color;
  final bool reversed;

  const RotatingCircle({
    super.key,
    this.gaps = 2,
    required this.color,
    this.reversed = false,
  });

  @override
  State<StatefulWidget> createState() => _RotatingCircleState();
}

class _RotatingCircleState extends State<RotatingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Dynamic size layouting
            final double size = min(constraints.maxWidth, constraints.maxHeight);
            return CustomPaint(
              painter: RotatingCirclePainter(
                rotation: widget.reversed ? -_controller.value : _controller.value,
                gaps: widget.gaps,
                color: widget.color,
              ),
              child: SizedBox(
                width: size,
                height: size,
              ),
            );
          },
        );
      },
    );
  }
}

class RotatingCirclePainter extends CustomPainter {
  final double rotation;
  final int gaps;
  final Color color;

  RotatingCirclePainter({required this.rotation, this.gaps = 3, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final double arcAngle = (2 * pi - gaps * 0.2) / gaps;
    final double startRotation = 2 * pi * rotation;

    for (int i = 0; i < gaps; i++) {
      final double startAngle = startRotation + i * (arcAngle + 0.2);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        arcAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
