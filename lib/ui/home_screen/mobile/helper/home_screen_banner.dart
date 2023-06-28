import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: BannerCarousel(
        viewportFraction: 1.0,
        showIndicator: false,
        initialPage: 1,
        customizedBanners: [
          SizedBox(
            width: 0.9.sw,
            height: 0.3.sh,
            child: Image.network(
              'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 0.9.sw,
            height: 0.3.sh,
            child: Image.network(
              'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 0.9.sw,
            height: 0.3.sh,
            child: Image.network(
              'http://cloud1.kodyinfotech.com:7000/online-test-management/public/uploads/media/20f89daadc90b1c4df3418dc1fa53e99.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
