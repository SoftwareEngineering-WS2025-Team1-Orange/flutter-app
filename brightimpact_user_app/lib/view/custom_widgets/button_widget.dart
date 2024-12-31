import 'dart:async';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String labelText;
  final Future<bool> Function()? onPressed;

  bool _isLoading = false;

  ButtonWidget({super.key, required this.labelText, this.onPressed});

  @override
  State<StatefulWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return SizedBox(
        width: screenWidth * 0.55,
        height: screenWidth * 0.13,
        child: ElevatedButton(
          onPressed: () {
            if (widget.onPressed != null && !widget._isLoading) {
              setState(() {
                widget._isLoading = true;
              });
              widget.onPressed!().whenComplete(() {
                setState(() {
                  widget._isLoading = false;
                });
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primaryColor,
          ),
          child: Center(
              child: widget._isLoading
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
        ));
  }
}
