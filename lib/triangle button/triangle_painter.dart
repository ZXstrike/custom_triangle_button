part of 'triangle_button_widget.dart';

/// Enum to define the direction of the triangle.
enum TriangleDirection { left, right, up, down }

/// A custom painter class that draws an equilateral triangular button with various customizable features.
///
/// This painter allows you to create triangle-shaped buttons with the following features:
/// * Customizable direction (up, down, left, right)
/// * Optional centered text
/// * Customizable colors for button, text, border, and shadow
/// * Rounded corners with adjustable radius
/// * Customizable shadow with offset, blur, and spread
/// * Semantic properties for accessibility
///
/// Example usage:
/// ```dart
/// CustomPaint(
///   painter: TrianglePainter(
///     text: "Click",
///     direction: TriangleDirection.up,
///     buttonColor: Colors.blue,
///     cornerRadius: 10,
///   ),
/// )
/// ```
///
/// The triangle is drawn as an equilateral triangle with the specified [triangleSize],
/// and the text is centered within the triangle using [texSize] for the font size.
///
/// The shadow effect can be customized using:
/// * [shadowOffset] - The offset of the shadow from the triangle
/// * [shadowRadius] - The spread of the shadow
/// * [shadowBlur] - The blur effect of the shadow
///
/// The triangle's appearance can be further customized with:
/// * [buttonColor] - The fill color of the triangle
/// * [buttonTextColor] - The color of the centered text
/// * [buttonBorderColor] - The color of the triangle's border
/// * [buttonShadowColor] - The color of the shadow
/// * [cornerRadius] - The radius of the rounded corners
class TrianglePainter extends CustomPainter {
  final String? text;
  final TriangleDirection direction;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color buttonBorderColor;
  final Color buttonShadowColor;
  final Offset shadowOffset;
  final double cornerRadius;
  final double triangleSize;
  final double texSize;
  final double shadowRadius; // New parameter for shadow spread
  final double shadowBlur; // New parameter for shadow blur

  TrianglePainter({
    this.text = '',
    required this.direction,
    this.buttonColor = Colors.cyan,
    this.buttonTextColor = Colors.white,
    this.buttonBorderColor = Colors.transparent,
    this.buttonShadowColor = Colors.black54,
    this.shadowOffset = Offset.zero,
    this.cornerRadius = 0,
    this.triangleSize = 40.0,
    this.texSize = 20.0,
    this.shadowRadius = 1.0, // Default shadow spread
    this.shadowBlur = 0.0, // Default shadow blur
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);

    final Paint paint = Paint()
      ..color = buttonColor
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = buttonBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Path path = _createEquilateralTrianglePath(direction, triangleSize);

    // Draw shadow with custom blur and spread
    if (buttonShadowColor != Colors.transparent) {
      final Path shadowPath = path.shift(shadowOffset);
      canvas.drawPath(
          shadowPath,
          Paint()
            ..color = buttonShadowColor
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlur)
            ..style = PaintingStyle.fill);
      // Draw shadow border
      canvas.drawPath(
        shadowPath,
        Paint()
          ..color = buttonShadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlur)
          ..style = PaintingStyle.stroke
          ..strokeWidth = shadowRadius,
      );
    }

    // Draw main triangle
    canvas.drawPath(path, paint);

    // Draw border if needed
    if (buttonBorderColor != Colors.transparent) {
      canvas.drawPath(path, borderPaint);
    }

    // Draw text
    _drawCenteredText(canvas, size);

    canvas.restore();
  }

  /// Creates an equilateral triangular path based on the specified direction and side length.
  Path _createEquilateralTrianglePath(
      TriangleDirection direction, double sideLength) {
    final double R = sideLength / sqrt(3);

    List<Offset> points;

    switch (direction) {
      case TriangleDirection.up:
        points = [
          Offset(0, -R),
          Offset(-sideLength / 2, R / 2),
          Offset(sideLength / 2, R / 2),
        ];
        break;
      case TriangleDirection.down:
        points = [
          Offset(0, R),
          Offset(-sideLength / 2, -R / 2),
          Offset(sideLength / 2, -R / 2),
        ];
        break;
      case TriangleDirection.left:
        points = [
          Offset(-R, 0),
          Offset(R / 2, -sideLength / 2),
          Offset(R / 2, sideLength / 2),
        ];
        break;
      case TriangleDirection.right:
        points = [
          Offset(R, 0),
          Offset(-R / 2, -sideLength / 2),
          Offset(-R / 2, sideLength / 2),
        ];
        break;
    }

    return _createRoundedCornerPath(points, cornerRadius);
  }

  /// Draws the text at the center of the triangle.
  void _drawCenteredText(Canvas canvas, Size size) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: buttonTextColor,
          fontSize: texSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final Offset textOffset = Offset(
      -textPainter.width / 2,
      -textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  /// Creates a path with rounded corners given a list of points.
  Path _createRoundedCornerPath(List<Offset> points, double radius) {
    final Path path = Path();
    final int len = points.length;

    for (int i = 0; i < len; i++) {
      Offset p1 = points[i];
      Offset p2 = points[(i + 1) % len];
      Offset p0 = points[(i - 1 + len) % len];

      Offset v1 = (p1 - p0).normalize();
      Offset v2 = (p1 - p2).normalize();

      double angle = acos((v1.dx * v2.dx + v1.dy * v2.dy).clamp(-1.0, 1.0));

      double distance = radius / tan(angle / 2);
      Offset offset1 = p1 - v1 * distance;
      Offset offset2 = p1 - v2 * distance;

      if (i == 0) {
        path.moveTo(offset1.dx, offset1.dy);
      } else {
        path.lineTo(offset1.dx, offset1.dy);
      }

      path.quadraticBezierTo(p1.dx, p1.dy, offset2.dx, offset2.dy);
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return text != oldDelegate.text ||
        direction != oldDelegate.direction ||
        buttonColor != oldDelegate.buttonColor ||
        buttonTextColor != oldDelegate.buttonTextColor ||
        buttonBorderColor != oldDelegate.buttonBorderColor ||
        buttonShadowColor != oldDelegate.buttonShadowColor ||
        shadowOffset != oldDelegate.shadowOffset ||
        cornerRadius != oldDelegate.cornerRadius ||
        triangleSize != oldDelegate.triangleSize ||
        shadowRadius != oldDelegate.shadowRadius ||
        shadowBlur != oldDelegate.shadowBlur;
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder => (Size size) {
        return [
          CustomPainterSemantics(
            rect: Offset.zero & size,
            properties: SemanticsProperties(
              label: text,
              button: true,
              enabled: true,
            ),
          ),
        ];
      };
}

/// Extension method to normalize an Offset.
extension NormalizeOffset on Offset {
  Offset normalize() {
    double len = distance;
    if (len == 0) return this;
    return this / len;
  }
}
