import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'custom_color.dart';

class BannerSlider extends StatelessWidget{
  const BannerSlider({super.key});
  @override
  Widget build(BuildContext context) {
    final conroller=PageController(viewportFraction: 0.8);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: conroller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(controller: conroller, count: 3,effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.white,
            expansionFactor: 4,
            activeDotColor: CustomColor.purpleColor,


          ),),
        )
      ],
    );
  }

}