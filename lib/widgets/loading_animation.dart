import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'custom_color.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [CustomColor.blueColor],
          strokeWidth: 0.1,

        ),
      ),
    );
  }
}