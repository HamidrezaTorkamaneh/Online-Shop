import 'package:flutter/material.dart';
import 'package:online_shop/widgets/cached_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'custom_color.dart';
 import '../data/model/banner.dart';



class BannerSlider extends StatelessWidget{
  List<BannerCampaign> bannerList;
  BannerSlider(this.bannerList,{super.key});
  @override
  Widget build(BuildContext context) {
    final controller=PageController(viewportFraction: 0.9);
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 177,
            child: PageView.builder(
              controller: controller,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    child: CachedImage(imageUrl: bannerList[index].thumbnail,radius: 15));
              },
            ),
          ),
          Positioned(
            bottom: 10,
            child: SmoothPageIndicator(controller: controller, count: 3,effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              dotColor: Colors.white,
              expansionFactor: 4,
              activeDotColor: CustomColor.purpleColor,
      
      
            ),),
          )
        ],
      ),
    );
  }

}