import 'dart:async';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String labelText;
  final Future<bool> Function()? onPressed;

  const ButtonWidget({super.key, required this.labelText, this.onPressed});

  @override
  State<StatefulWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Animation Controller for button shaking
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Animation for horizontal shaking
    _animation = Tween<double>(begin: 0, end: 20)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Moves button for shaking animation
          return Transform.translate(
            offset: Offset(_animation.value, 0),
            child: child,
          );
        },
        child: SizedBox(
            width: screenWidth * 0.55,
            height: screenWidth * 0.13,
            child: ElevatedButton(
              onPressed: () async {
                if (widget.onPressed != null && !_isLoading) {
                  setState(() {
                    _isLoading = true;
                  });
                  final result = await widget.onPressed!();
                  if (!result) {
                    _controller.forward();
                  }
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
              ),
              child: Center(
                  child: _isLoading
                      ? SizedBox(
                          height: screenWidth * 0.05,
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: CircularProgressIndicator(
                                  color: theme.secondaryHeaderColor)))
                      : Text(
                          widget.labelText,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            color: theme.secondaryHeaderColor,
                          ),
                        )),
            )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
