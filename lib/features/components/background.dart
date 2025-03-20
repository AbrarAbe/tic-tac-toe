import 'package:flutter/material.dart';
import 'package:dynamic_background/dynamic_background.dart';

class BackgroundAnimation extends StatelessWidget {
  final Widget child;
  const BackgroundAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: DynamicBg(
        duration: const Duration(seconds: 35),
        painterData: LavaPainterData(
          width: 250.0,
          widthTolerance: 75.0,
          growAndShrink: true,
          growthRate: 10.0,
          growthRateTolerance: 5.0,
          blurLevel: 25.0,
          numBlobs: 5,
          backgroundColor: Colors.transparent,
          colors: [
            ColorSchemes.vibrantOrangeBg,
            ColorSchemes.vibrantOrangeFg,
            ColorSchemes.vibrantYellowBg,
            ColorSchemes.vibrantYellowFg,
          ],
          allSameColor: false,
          fadeBetweenColors: true,
          changeColorsTogether: false,
          speed: 20.0,
          speedTolerance: 5.0,
        ),
        child: child,
      ),
    );
  }
}
