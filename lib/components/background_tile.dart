import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class BackgroundTile extends ParallaxComponent with HasGameRef {
  final String color;
  BackgroundTile({
    this.color = 'Gray',
    position,
  });

  final double scrollSpeed = 40;

  @override
  FutureOr<void> onLoad() async {
    priority = -10;
    size = Vector2.all(64);
    parallax = await gameRef.loadParallax(
      [ParallaxImageData('Background/Mountain.png')],
      fill: LayerFill.height,
    );
    return super.onLoad();
  }
}
