Here’s a simple `README.md` file for your `TriangleButtonWidget`:

```markdown
# TriangleButtonWidget

A highly customizable Flutter widget for creating triangle-shaped buttons with support for various styles, gestures, and configurations.

---

## Features

- **Triangle Direction**: Customize the orientation (up, down, left, or right).
- **Fully Customizable**: Change colors, size, border, shadows, and text styles.
- **Flexible Content**: Add a child widget or display text inside the button.
- **Gesture Handling**: Supports tap and double-tap interactions with optional callbacks.

---

## Installation

Add the file containing the `TriangleButtonWidget` class to your Flutter project and import it where needed.

```dart
import 'path_to_triangle_button_widget.dart';
```

---

## Usage

### Basic Example
```dart
TriangleButtonWidget(
  text: "Play",
  direction: TriangleDirection.right,
  buttonColor: Colors.blue,
  buttonTextColor: Colors.white,
  size: 50.0,
  onTap: () {
    print("Button tapped!");
  },
)
```

### Example with Custom Child and Shadow
```dart
TriangleButtonWidget(
  child: Icon(Icons.play_arrow, color: Colors.white),
  direction: TriangleDirection.up,
  buttonColor: Colors.red,
  shadowOffset: Offset(2, 2),
  shadowBlur: 4.0,
  shadowRadius: 2.0,
  buttonShadowColor: Colors.black38,
  onTap: () {
    print("Custom button tapped!");
  },
)
```

---

## Parameters

| Parameter              | Type                       | Default              | Description                                        |
|------------------------|----------------------------|----------------------|----------------------------------------------------|
| `child`                | `Widget?`                 | `null`               | Custom widget to display inside the button.       |
| `text`                 | `String?`                 | `null`               | Text to display if no child widget is provided.   |
| `direction`            | `TriangleDirection`       | `TriangleDirection.right` | Orientation of the triangle (up, down, left, right). |
| `buttonColor`          | `Color`                   | `Colors.blue`        | Background color of the button.                   |
| `buttonTextColor`      | `Color`                   | `Colors.transparent` | Text color inside the button.                     |
| `buttonBorderColor`    | `Color`                   | `Colors.transparent` | Border color of the triangle.                     |
| `size`                 | `double`                  | `30.0`               | Width and height of the button.                   |
| `pointRounding`        | `double`                  | `0.0`                | Rounds the triangle's corners.                    |
| `shadowOffset`         | `Offset`                  | `Offset.zero`        | Offset for the button's shadow.                   |
| `shadowBlur`           | `double`                  | `0.0`                | Blur radius for the shadow.                       |
| `shadowRadius`         | `double`                  | `1.0`                | Spread radius for the shadow.                     |
| `onTap`                | `void Function()?`        | `null`               | Callback for tap gesture.                         |
| `onDoubleTap`          | `void Function()?`        | `null`               | Callback for double-tap gesture.                  |

---

## Customization

- **Direction**: Use the `direction` parameter to orient the triangle (e.g., `TriangleDirection.up`).
- **Shadows**: Customize shadow effects with `shadowOffset`, `shadowBlur`, and `shadowRadius`.
- **Content**: Add a custom widget via `child` or display text using the `text` parameter.

---
