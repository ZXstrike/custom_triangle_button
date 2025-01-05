import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

part 'triangle_painter.dart';

/// An equilateral triangular button widget with a child widget and text.
/// The button can be customized with the following parameters:
/// - [child]: The child widget to be displayed inside the button.
/// - [direction]: The direction of the triangle.
/// - [text]: The text to be displayed inside the button.
/// - [buttonColor]: The color of the button.
/// - [buttonTextColor]: The color of the text.
/// - [buttonBorderColor]: The color of the border.
/// - [buttonShadowColor]: The color of the shadow.
/// - [shadowOffset]: The offset of the shadow.
/// - [size]: The size of the button.
/// - [cornerRadius]: The corner radius of the button.
/// - [shadowRadius]: The radius of the shadow.
/// - [shadowBlur]: The blur of the shadow.
/// - [texSize]: The size of the text.
/// - [padding]: The padding of the button.
/// - [margin]: The margin of the button.
/// - [alignment]: The alignment of the child widget.
/// - [onTap]: The callback function for tap events.
/// - [onDoubleTap]: The callback function for double tap events.
/// - [onTapCancel]: The callback function for tap cancel events.
/// - [onDoubleTapCancel]: The callback function for double tap cancel events.
/// - [onTapDown]: The callback function for tap down events.
/// - [onDoubleTapDown]: The callback function for double tap down events.
/// - [onTapUp]: The callback function for tap up events.
/// - [onDoubleTapUp]: The callback function for double tap up events.
///
/// Example:
/// ```dart
/// TriangleButtonWidget(
///  child: Icon(Icons.add),
/// direction: TriangleDirection.right,
/// text: 'Add',
/// buttonColor: Colors.blue,
/// buttonTextColor: Colors.white,
/// buttonBorderColor: Colors.black,
/// buttonShadowColor: Colors.grey,
/// shadowOffset: Offset(2, 2),
/// size: 50,
/// cornerRadius: 10,
/// texSize: 20,
/// padding: EdgeInsets.all(10),
/// margin: EdgeInsets.all(10),
/// alignment: Alignment.center,
/// onTap: () {
///  print('Button tapped');
/// },
/// onDoubleTap: () {
/// print('Button double tapped');
/// },
/// onTapCancel: () {
/// print('Button tap canceled');
/// },
/// onDoubleTapCancel: () {
/// print('Button double tap canceled');
/// },
/// onTapDown: (details) {
/// print('Button tap down');
/// },
/// onDoubleTapDown: (details) {
/// print('Button double tap down');
/// },
/// onTapUp: (details) {
/// print('Button tap up');
/// },
/// onDoubleTapUp: (details) {
/// print('Button double tap up');
/// },
/// )
/// ```
///
/// This will create a triangular button with an icon and text that can be tapped or double tapped.
/// The button will have a blue color with white text, black border, and grey shadow.
/// The button will have a size of 50, a corner radius of 10, and a text size of 20.
/// The button will have padding and margin of 10 and will align the child widget to the center.
/// The button will print messages when tapped or double tapped.
///
/// See also:
/// - [TriangleDirection], an enum for the direction of the triangle.
/// - [TrianglePainter], a custom painter to draw the triangular button.

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
    this.cornerRadius = 0.0,
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
    this.shadowRadius = 0.0,
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
  final double cornerRadius;
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(widget.size, widget.size),
              painter: TrianglePainter(
                direction: widget.direction,
                buttonBorderColor: widget.buttonBorderColor,
                buttonColor: widget.buttonColor,
                buttonShadowColor: widget.buttonShadowColor,
                buttonTextColor: widget.buttonTextColor,
                cornerRadius: widget.cornerRadius,
                shadowOffset: widget.shadowOffset,
                shadowRadius: widget.shadowRadius,
                shadowBlur: widget.shadowBlur,
                texSize: widget.texSize,
                text: widget.text,
                triangleSize: widget.size,
              ),
            ),
            if (widget.child != null)
              Container(
                width: widget.size,
                height: widget.size,
                alignment: widget.alignment,
                margin: widget.margin,
                padding: widget.padding,
                child: widget.child!,
              ),
          ],
        ),
      ),
    );
  }
}
