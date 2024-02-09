import 'package:flutter/material.dart';

class FastScrollPhysics extends ScrollPhysics {
  final double scrollSpeed;

  FastScrollPhysics({ScrollPhysics? parent, this.scrollSpeed = 1.0})
      : super(parent: parent);

  @override
  FastScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return FastScrollPhysics(
        parent: buildParent(ancestor), scrollSpeed: scrollSpeed);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset * scrollSpeed;
  }
}
