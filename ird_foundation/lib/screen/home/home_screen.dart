import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ird_foundation_task/controller/hadith_controller.dart';
import 'package:ird_foundation_task/global/constants/color_resources.dart';
import 'package:ird_foundation_task/global/constants/images.dart';
import 'package:ird_foundation_task/global/method/global_image_loader.dart';
import 'package:ird_foundation_task/global/method/global_text.dart';
import 'package:ird_foundation_task/global/method/show_toast.dart';
import 'package:ird_foundation_task/global/method/sizebox_widget.dart';

import 'hadiths_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<MenuModel> menuItem = [
    MenuModel(img: Images.last, text: 'Last'),
    MenuModel(img: Images.goTo, text: 'Go To'),
    MenuModel(img: Images.apps, text: 'Apps'),
    MenuModel(img: Images.sadaqa, text: 'Sadaqa'),
  ];

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  List textItem = [
    '“A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.”',
    '“A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.”',
    '“A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.”',
    '“A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.”',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(builder: (hadithCon) {
      return Scaffold(
        backgroundColor: ColorRes.backGround,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
                statusBarColor: ColorRes.safeArea
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(height: 450, width: size(context).width),
                        Container(
                          height: 400,
                          width: size(context).width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF0E8468),
                                Color(0xFF1AA483),
                                Color(0xFF2BB997),
                              ],
                              stops: [0.0, 1.0, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 42,
                                width: size(context).width,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: const GlobalImageLoader(
                                        imagePath: Images.menu,
                                        height: 14,
                                        width: 24,
                                      ),
                                    ),
                                    const GlobalText(
                                      str: 'Al Hadith',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: ColorRes.white,
                                      textAlign: TextAlign.center,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const HadithsDetailsScreen());
                                      },
                                      child: const GlobalImageLoader(
                                        imagePath: Images.search,
                                        height: 22,
                                        width: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 100,
                                  left: 20,
                                  right: 20,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      Get.to(() => const HadithsDetailsScreen());
                                    },
                                    child: CarouselSlider(
                                      carouselController: carouselController,
                                      items: textItem.map((item) {
                                        return Column(
                                          children: [
                                            const GlobalText(
                                              str: '“A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.”',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: ColorRes.white,
                                              textAlign: TextAlign.center,
                                              height: 2,
                                              // fontFamily: 'Hind Siliguri',
                                            ),
                                            sizedBoxH(20),
                                            const GlobalText(
                                              str: '[ Bukhari and Muslim ]',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: ColorRes.white,
                                              textAlign: TextAlign.center,
                                              height: 2,
                                              // fontFamily: 'Hind Siliguri',
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                          scrollPhysics: const BouncingScrollPhysics(),
                                          autoPlay: true,
                                          aspectRatio: 2,
                                          viewportFraction: 1,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              currentIndex = index;
                                            });
                                            // Get.to(()=> const HadithsDetailsScreen());
                                          }
                                      ),
                                    ),
                                  )
                              ),
                              Positioned(
                                bottom: 0,
                                child: GlobalImageLoader(
                                  imagePath: Images.homeBackimg2,
                                  width: size(context).width,
                                  fit: BoxFit.cover,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 15,
                          right: 15,
                          child: Container(
                            height: 120,
                            width: size(context).width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorRes.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: menuItem.asMap().entries.map((entry) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    switch (entry.key) {
                                      case 0:
                                        showToast("Still Developed 0");
                                        break;
                                      case 1:
                                        showToast("Still Developed 1");
                                        break;
                                      case 2:
                                        showToast("Still Developed 2");
                                        break;
                                      case 3:
                                        showToast("Still Developed 3");
                                        break;
                                    }
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GlobalImageLoader(
                                        imagePath: entry.value.img,
                                        height: 32,
                                        width: 32,
                                      ),
                                      sizedBoxH(10),
                                      GlobalText(
                                        str: entry.value.text,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorRes.menuText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: IgnorePointer(
                            ignoring: true,
                            child: GlobalImageLoader(
                              imagePath: Images.homeBackimg1,
                              height: 400,
                              width: size(context).width,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxH(20),
                    /// ===@ All Hadith Book @====
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: GlobalText(
                          str: "All Hadith Book",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    sizedBoxH(10),
                    ListView.builder(
                        itemCount: 8,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => const HadithsDetailsScreen());
                            },
                            child: Container(
                              height: 90,
                              width: size(context).width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorRes.white
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 50, width: 50,
                                    child: Stack(
                                      children: [
                                        GlobalImageLoader(
                                          imagePath: Images.bookCon,
                                          height: 50,
                                          width: 50,
                                        ),
                                        Center(
                                          child: GlobalText(
                                            str: 'B',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: ColorRes.white,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  sizedBoxW(10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const GlobalText(
                                        str: 'Sahih Muslim',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: ColorRes.textColor1,
                                      ),
                                      sizedBoxH(5),
                                      const GlobalText(
                                        str: 'Imam Bukhari',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorRes.textColor1,
                                        fontFamily: 'Inter',
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const GlobalText(
                                        str: '7563',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: ColorRes.textColor1,
                                      ),
                                      sizedBoxH(5),
                                      const GlobalText(
                                        str: 'Hadith',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorRes.textColor1,
                                        fontFamily: 'Inter',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class MenuModel {
  String img;
  String text;

  MenuModel({
    required this.img,
    required this.text
  });

}