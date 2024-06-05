import 'package:flutter_application_1/style/app_style.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class Page1 extends StatelessWidget {
  final NotchBottomBarController? controller;

  const Page1({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/set.png',
                height: 70,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'O\'zbekiston Respublikasi',
                    style: AppStyle.fontStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Milliy Gvardiyasi Qo\'riqlash Xizmati',
                    style: AppStyle.fontStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 10,
          ),
          Card(
              //  width: double.infinity,
              //  height: 200,
              child: ImageSlideshow(
            /// Width of the [ImageSlideshow].
            width: double.infinity,

            /// Height of the [ImageSlideshow].
            height: 200,

            /// The page to show when first creating the [ImageSlideshow].
            initialPage: 0,

            /// The color to paint the indicator.
            indicatorColor: Colors.blue,

            /// The color to paint behind th indicator.
            indicatorBackgroundColor: Colors.grey,

            /// The widgets to display in the [ImageSlideshow].
            /// Add the sample image file into the images folder
            children: [
              Image.asset(
                'assets/images/image1.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/image2.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/image3.jpg',
                fit: BoxFit.cover,
              ),
            ],

            /// Called whenever the page in the center of the viewport changes.
            onPageChanged: (value) {
              print('Page changed: $value');
            },

            /// Auto scroll interval.
            /// Do not auto scroll with null or 0.
            // autoPlayInterval: 5000,

            /// Loops back to first slide.
            isLoop: true,
          )),
          // ListView.builder(
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       leading: Icon(Icons.media_bluetooth_off),
          //     );
          //   },
          //   itemCount: 3,
          // )
        ],
      ),
    );
  }
}
