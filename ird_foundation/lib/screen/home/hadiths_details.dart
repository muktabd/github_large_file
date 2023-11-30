import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ird_foundation_task/global/constants/color_resources.dart';
import 'package:ird_foundation_task/global/constants/images.dart';
import 'package:ird_foundation_task/global/method/global_image_loader.dart';
import 'package:ird_foundation_task/global/method/global_text.dart';
import 'package:ird_foundation_task/global/method/sizebox_widget.dart';

import '../../controller/hadith_controller.dart';
import 'home_screen.dart';

class HadithsDetailsScreen extends StatefulWidget {
  const HadithsDetailsScreen({super.key});

  @override
  State<HadithsDetailsScreen> createState() => _HadithsDetailsScreenState();
}

class _HadithsDetailsScreenState extends State<HadithsDetailsScreen> {

  List<MenuModel> menuItem = [
    MenuModel(img: Images.send, text: 'Go To Main Hadith'),
    MenuModel(img: Images.addSave, text: 'Add to Collection'),
    MenuModel(img: Images.copy, text: 'Bangla Copy'),
    MenuModel(img: Images.copy, text: 'English Copy'),
    MenuModel(img: Images.copy, text: 'Arabic Copy'),
    MenuModel(img: Images.addHafz, text: 'Add Hifz'),
    MenuModel(img: Images.addHafz, text: 'Add Note'),
    MenuModel(img: Images.share, text: 'Share'),
    MenuModel(img: Images.report, text: 'Report'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HadithController>().fetchHadithData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorRes.primary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            backgroundColor: ColorRes.primary,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: const GlobalImageLoader(
                    imagePath: Images.back,
                    height: 16,
                    width: 15,
                  ),
                ),
                sizedBoxW(15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      str: 'Sahih Bukhari',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.white,
                    ),
                    GlobalText(
                      str: 'Revelation',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorRes.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: ColorRes.safeArea
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: size(context).width,
                    decoration: const BoxDecoration(
                        color: ColorRes.backGround,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                        )
                    ),
                    child: NotificationListener<
                        OverscrollIndicatorNotification>(
                      onNotification: (overScroll) {
                        overScroll.disallowIndicator();
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// ==@ Chapter
                            sizedBoxH(15),
                            Container(
                              width: size(context).width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorRes.white
                              ),
                              child: Column(
                                children: [
                                  const Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(
                                              text: '1/1 Chapter: ',
                                              style: TextStyle(
                                                  color: ColorRes.primary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.6
                                              )
                                          ),
                                          TextSpan(
                                              text: "How the Divine Revelation started being revealed to Allah's Messenger",
                                              style: TextStyle(
                                                  color: ColorRes.menuText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Lato',
                                                  height: 1.6
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                  sizedBoxH(10),
                                  const Divider(
                                      height: 1, color: ColorRes.border),
                                  sizedBoxH(10),
                                  const GlobalText(
                                    str: 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ColorRes.textColor2,
                                    height: 1.5,
                                    fontFamily: 'Inter',
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxH(10),

                            /// ==@ Hadith

                            ListView.builder(
                                itemCount: controller.hadithList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  // var hadith = controller.hadithList[index];
                                  return Container(
                                    width: size(context).width,
                                    margin: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 10),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorRes.white
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 45,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                height: 45, width: 45,
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
                                              sizedBoxW(8),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  GlobalText(
                                                    str: controller.hadithList[index].bookName,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorRes.textColor2,
                                                    height: 1.2,
                                                    fontFamily: 'Inter',
                                                  ),
                                                  Text.rich(
                                                    TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                              text: "হাদিস: ",
                                                              style: TextStyle(
                                                                  color: ColorRes.primary,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontFamily: 'Lato',
                                                                  height: 1.6
                                                              )
                                                          ),
                                                          TextSpan(
                                                              text: '${controller.hadithList[index].bookId}',
                                                              style: const TextStyle(
                                                                  color: ColorRes.primary,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1.6
                                                              )
                                                          ),
                                                        ]
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(child: Container()),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(50),
                                                        color: ColorRes.primary
                                                    ),
                                                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                                    child: GlobalText(
                                                      str: controller.hadithList[index].grade,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: ColorRes.white,
                                                      fontFamily: 'Inter',
                                                    ),
                                                  ),
                                                  sizedBoxW(10),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          backgroundColor: ColorRes.white,
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(20),
                                                                  topLeft: Radius.circular(20)
                                                              )
                                                          ),
                                                          builder: (context) {
                                                            return Container(
                                                              height: 440,
                                                              width: size(context).width,
                                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                                              child: NotificationListener<OverscrollIndicatorNotification>(
                                                                onNotification: (overScroll) {
                                                                  overScroll.disallowIndicator();
                                                                  return true;
                                                                },
                                                                child: SingleChildScrollView(
                                                                  child: Column(
                                                                    children: [
                                                                      sizedBoxH(30),
                                                                      Row(
                                                                        children: [
                                                                          const GlobalText(
                                                                            str: 'More Option',
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w600,
                                                                            color: ColorRes.textColor3,
                                                                            fontFamily: 'Inter',
                                                                          ),
                                                                          Expanded(
                                                                              child: Container()),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              Get.back();
                                                                            },
                                                                            child: const GlobalImageLoader(
                                                                              imagePath: Images.close,
                                                                              height: 15,
                                                                              width: 15,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      sizedBoxH(
                                                                          15),
                                                                      Column(
                                                                          children: menuItem.asMap().entries.map((entry) {
                                                                            return Container(
                                                                              margin: const EdgeInsets.symmetric(vertical: 12),
                                                                              child: Row(
                                                                                  children: [
                                                                                    GlobalImageLoader(
                                                                                      imagePath: entry.value.img,
                                                                                      height: 15,
                                                                                      width: 15,
                                                                                    ),
                                                                                    sizedBoxW(12),
                                                                                    GlobalText(
                                                                                      str: entry.value.text,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: ColorRes.menuText,
                                                                                      fontFamily: 'Inter',
                                                                                    ),
                                                                                  ]
                                                                              ),
                                                                            );
                                                                          })
                                                                              .toList()
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                      );
                                                    },
                                                    child: const GlobalImageLoader(
                                                      imagePath: Images.moreHori,
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                  ),
                                                  sizedBoxW(5),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        sizedBoxH(20),
                                        GlobalText(
                                          str: controller.hadithList[index].ar,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: ColorRes.textColor2,
                                          height: 2,
                                          fontFamily: 'me_quran',
                                          textAlign: TextAlign.right,
                                        ),
                                        sizedBoxH(20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            GlobalText(
                                              str: '${controller.hadithList[index].narrator} থেকে বর্ণিতঃ',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: ColorRes.primary,
                                              fontFamily: 'Inter',
                                            ),
                                          ],
                                        ),
                                        sizedBoxH(10),
                                        GlobalText(
                                          str: controller.hadithList[index].bn,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ColorRes.textColor2,
                                          height: 1.5,
                                          fontFamily: 'Inter',
                                        ),
                                        sizedBoxH(15),

                                      ],
                                    ),
                                  );
                                }
                            ),

                            sizedBoxH(10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
