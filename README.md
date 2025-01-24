# Custom Triangle Button

A Flutter widget that creates customizable triangle-shaped buttons with various orientations and styling options.

![Screenshot 2025-01-05 203008](https://github.com/user-attachments/assets/0ccbb6d5-2715-40c5-b65e-bfb55f66455b)

## Features
- 🔺 Triangle buttons in 4 directions (up, down, left, right)
- 🎨 Customizable colors, borders, and shadows
- 👆 Gesture support (tap, double tap)
- 🖼️ Support for child widgets (icons, etc.)
- 💫 Shadow and corner radius customization

## Setup

1. Copy these files to your project:
   - `triangle_button_widget.dart`
   - `triangle_painter.dart`

2. Import in your code:
```dart
import 'path/to/triangle_button_widget.dart';
```

## Basic Usage

```dart
TriangleButtonWidget(
  direction: TriangleDirection.right,
  text: 'Click Me',
  buttonColor: Colors.blue,
  size: 100,
)
```

## Properties

### Core Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `direction` | `TriangleDirection` | `right` | Button orientation (up/down/left/right) |
| `size` | `double` | `30.0` | Size of the triangle button |
| `text` | `String?` | `null` | Text displayed in button |
| `child` | `Widget?` | `null` | Widget displayed inside button |

### Styling Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `buttonColor` | `Color` | `Colors.blue` | Main button fill color |
| `buttonTextColor` | `Color` | `transparent` | Color of the text |
| `buttonBorderColor` | `Color` | `transparent` | Color of button border |
| `buttonShadowColor` | `Color` | `transparent` | Color of shadow |
| `cornerRadius` | `double` | `0.0` | Radius for rounded corners |
| `texSize` | `double` | `0.0` | Size of text |

### Shadow Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `shadowOffset` | `Offset` | `Offset.zero` | Shadow position offset |
| `shadowRadius` | `double` | `0.0` | Shadow spread radius |
| `shadowBlur` | `double` | `0.0` | Shadow blur effect |

### Layout Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `padding` | `EdgeInsets` | `EdgeInsets.zero` | Internal padding |
| `margin` | `EdgeInsets` | `EdgeInsets.zero` | External margin |
| `alignment` | `Alignment` | `center` | Child widget alignment |

### Gesture Callbacks

| Property | Type | Description |
|----------|------|-------------|
| `onTap` | `VoidCallback?` | Called when button is tapped |
| `onDoubleTap` | `VoidCallback?` | Called on double tap |
| `onTapDown` | `GestureTapDownCallback?` | Called when tap starts |
| `onTapUp` | `GestureTapUpCallback?` | Called when tap ends |
| `onTapCancel` | `VoidCallback?` | Called when tap is canceled |

## Examples

### Basic Colored Button
```dart
TriangleButtonWidget(
  direction: TriangleDirection.up,
  buttonColor: Colors.blue,
  size: 100,
)
```

### Button with Text and Shadow
```dart
TriangleButtonWidget(
  direction: TriangleDirection.right,
  text: 'Next',
  buttonColor: Colors.green,
  buttonTextColor: Colors.white,
  buttonShadowColor: Colors.black54,
  shadowOffset: Offset(2, 2),
  shadowRadius: 3,
  size: 100,
  texSize: 20,
)
```

### Button with Icon and Border
```dart
TriangleButtonWidget(
  direction: TriangleDirection.left,
  child: Icon(Icons.arrow_back),
  buttonColor: Colors.amber,
  buttonBorderColor: Colors.black,
  cornerRadius: 10,
  size: 80,
)
```
