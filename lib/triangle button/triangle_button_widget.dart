import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

part 'triangle_painter.dart';

class TriangleButtonWidget extends StatefulWidget {
  const TriangleButtonWidget({
    super.key,
    this.child,
    this.direction = TriangleDirection.right,
    this.text,
    this.buttonColor = Colors.blue,
    this.buttonTextColor = Colors.transparent,
    this.buttonBorderColor = Colors.transparent,
    this.buttonShadowColor = Colors.transparent,
    this.shadowOffset = Offset.zero,
    this.size = 30.0,
    this.pointRounding = 0.0,
    this.texSize = 0.0,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.onTap,
    this.onDoubleTap,
    this.onTapCancel,
    this.onDoubleTapCancel,
    this.onTapDown,
    this.onDoubleTapDown,
    this.onTapUp,
    this.onDoubleTapUp,
    this.shadowRadius = 1.0,
    this.shadowBlur = 0.0,
  });

  final Widget? child;
  final TriangleDirection direction;

  final String? text;

  final Color buttonColor;
  final Color buttonTextColor;
  final Color buttonBorderColor;
  final Color buttonShadowColor;

  final Offset shadowOffset;

  final EdgeInsets padding;
  final EdgeInsets margin;

  final Alignment alignment;

  final double size;
  final double pointRounding;
  final double shadowRadius;
  final double shadowBlur;
  final double texSize;

  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onTapCancel;
  final void Function()? onDoubleTapCancel;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapDownDetails)? onDoubleTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function(TapUpDetails)? onDoubleTapUp;

  @override
  State<TriangleButtonWidget> createState() => _TriangleButtonWidgetState();
}

class _TriangleButtonWidgetState extends State<TriangleButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: GestureDetector(
        onDoubleTap: widget.onDoubleTap,
        onDoubleTapCancel: widget.onDoubleTapCancel,
        onDoubleTapDown: widget.onDoubleTapDown,
        onTap: widget.onTap,
        onTapCancel: widget.onTapCancel,
        onTapDown: widget.onTapDown,
        onTapUp: widget.onTapUp,
        child: Container(
          width: widget.size,
          height: widget.size,
          alignment: widget.alignment,
          margin: widget.margin,
          padding: widget.padding,
          decoration: ShapeDecoration(
            color: widget.buttonColor,
            shadows: [
              BoxShadow(
                color: widget.buttonShadowColor,
                offset: widget.shadowOffset,
                blurRadius: widget.shadowBlur,
                spreadRadius: widget.shadowRadius,
              ),
            ],
            shape: StarBorder.polygon(
              side: BorderSide(
                width: 2,
                color: widget.buttonBorderColor,
              ),
              sides: 3,
              pointRounding: widget.pointRounding,
              rotation: switch (widget.direction) {
                TriangleDirection.left => 270,
                TriangleDirection.right => 90,
                TriangleDirection.up => 0,
                TriangleDirection.down => 180,
              },
            ),
          ),
          child: widget.child ??
              Text(
                widget.text ?? '',
                style: TextStyle(
                  color: widget.buttonTextColor,
                  fontSize: widget.texSize,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
        ),
      ),
    );
  }
}
